<!---
	Steps 
	1. Validate form and perform all steps below if the form is valid
	2. Create all requied directories with proper permission if they are not already there.
	3. (IF) Upload the image, rename it and create thumbs
	4. (IF Conditions are met) Upload sample and set sampleIsUploaded to TRUE; used in tying sample to video
	5. Update video
	6. Delete selected files and update others
	7. (IF) Edit subscriable product
		7.1. Was it a subscriable product?
			 N: Is it Now?
			 	N: Return
			 	Y: Create an id for the subscription plan
			 	   Create a subscription plan with default values
			 	   Upload sample if there is any
			 Y: Is it Now?
			 	N: Try to remove all subscription related entry. If not possible set the prices to 0
			 	Y: Set new price
			 	   Upload sample there is any
			 	   Update sample name if necessary
			 
--->

<cfinclude template="validatevideoform.cfm">
<cfif thereAreNoErrorsInForm>
	<cfset sampleIsUploaded=FALSE>
	<cfset sampleNameHasBeenChanged=FALSE>
	<cfset imagefile=0>
	<cfset samplefile=0>
	<cfinclude template="createdirectories.cfm"> <!--- sets variables destination,imageDestination,sampleDestination --->
	<cftry>
		<cfif Trim(form.photoupload) NEQ "">
			<cffile action="upload" filefield="photoupload" destination="#imageDestination#" nameconflict="makeUnique" result="uploadedImageFile" accept="image/gif,image/jpg,image/jpeg,image/png">
			<cfset imagefile=application.objimagegallery.renamefile(imageDestination,uploadedImageFile.serverFile,uploadedImageFile.serverFileExt)>
			<cfinclude template="createthumbs.cfm">
		</cfif>
		
		<cfif form.subscriableproduct EQ 1>
			<cfif Trim(form.sample) NEQ "">
				<cffile action="upload" filefield="sample" destination="#sampleDestination#" nameconflict="makeUnique" result="uploadedSampleFile">
				<cfset samplefile=application.objimagegallery.renamefile(sampleDestination,uploadedSampleFile.serverFile,uploadedSampleFile.serverFileExt)>
				<cfset sampleIsUploaded=TRUE>
			<cfelseif IsNumeric(form.sampleid)>
				<cfset sampleNameHasBeenChanged=TRUE>
			</cfif>
		</cfif>
		<cftransaction>
			<cfinvoke component="#application.objvideolib#" method="updateVideo" videodsn="#client.siteurl#" imagepath="#imagefile#" argumentcollection="#form#">
			<cfloop list="#form.deletefiles#" index="fileid">
				<cfinvoke component="#application.objfile#" method="deletefile" filedsn='#client.siteurl#' fileid="#fileid#">	
				<cfset index=listFind(form.filelist,fileid)>
				<cfif index GT 0>
					<cfset form.filelist=listDeleteAt(form.filelist,index)>
				</cfif>
			</cfloop>
			<cfloop list="#form.filelist#" index="fileid">
				<cfset title=Evaluate('form.title_#fileid#')>
				<cfset description=Evaluate('form.description_#fileid#')>
				<cfinvoke component="#application.objfile#" method="updatefile" filedsn="#client.siteurl#" fileid="#fileid#" title="#title#" description="#description#">
			</cfloop>
		</cftransaction>
		<cfinclude template="editsubscriableproduct.cfm">
		<cfinclude template="/actions/tracking.cfm">
		<cfcatch type="any">
			<cfset client.message="The request could not be completed because of error. #cfcatch.message#">
		</cfcatch>
	</cftry>
	<cflocation url="/cms/#url.section#/#url.module#/viewalbum/?id=#form.videocategoryid#" addtoken="false">
<cfelse>
	<cflocation url="#CGI.HTTP_REFERER#" addtoken="false">
</cfif>