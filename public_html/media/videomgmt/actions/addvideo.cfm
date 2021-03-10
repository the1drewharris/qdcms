<!--- 
	Steps:
	1. Validate the form. Perform all steps below if the form is valid. Return otherwise.
	2. Create all requied directories with proper permission if they are not already there.
	3. Upload video and rename it as per our standard
	4. Upload the image, rename it and create thumbs
	5. Create a product, add video and add to a category,
	6. Set the video as subscriable product by setting it to a default plan if susbscriable product has been checked
		6.1 Create an id for the subscription plan
		6.2 Create a subscription plan with default values in default plan; use getdefaultplan() method in product.cfc
		6.3 Upload sample if there is any
--->
<cfinclude template="validatevideoform.cfm">
<cfif thereAreNoErrorsInForm>
	<cfset sampleIsUploaded=FALSE>
	<cfinclude template="createdirectories.cfm"> <!--- sets variables destination,imageDestination,sampleDestination --->
	<cftry>
		<!---Upload Part, rename part --->
		<cffile action="upload" filefield="video" destination="#destination#" nameconflict="makeUnique" result="uploadedVideoFile">
		<cfset videofile=application.objimagegallery.renamefile(destination,uploadedVideoFile.serverFile,uploadedVideoFile.serverFileExt)>
		<cffile action="upload" filefield="photoupload" destination="#imageDestination#" nameconflict="makeUnique" result="uploadedImageFile" accept="image/gif,image/jpg,image/jpeg,image/png">
		<cfset imagefile=application.objimagegallery.renamefile(imageDestination,uploadedImageFile.serverFile,uploadedImageFile.serverFileExt)>
		<cfif Trim(form.sample) NEQ "">
			<cffile action="upload" filefield="sample" destination="#sampleDestination#" nameconflict="makeUnique" result="uploadedSampleFile">
			<cfset samplefile=application.objimagegallery.renamefile(sampleDestination,uploadedSampleFile.serverFile,uploadedSampleFile.serverFileExt)>
			<cfset sampleIsUploaded=TRUE>
		</cfif>
		<cfinclude template="createthumbs.cfm">
		<!--- Database part --->
		<cftransaction>
			<cfset id=application.objproduct.createID(client.siteurl,'Media',form.title,1,0)>
			<cfset application.objvideolib.addVideo(client.siteurl,id,form.title,videofile,form.keywords,0,form.link,'',form.status,imagefile,'',form.summary,form.description,form.caption,1)>
			<cfset application.objvideolib.videoToCategory(client.siteurl,id,form.videocategoryid)>
			<cfif form.subscriableproduct EQ 1>
				<cfinclude template="addsubscriableproduct.cfm">
			</cfif>
		</cftransaction>
		<cfinclude template="/actions/tracking.cfm">
		<cfcatch type="any">
			<cfset client.message="The request could not be completed because of error. #cfcatch.message#">
		</cfcatch>
	</cftry>
	<cflocation url="/cms/#url.section#/#url.module#/viewalbum/?id=#form.videocategoryid#" addtoken="false">
<cfelse>
	<cflocation url="#CGI.HTTP_REFERER#" addtoken="false">
</cfif>