<cfset objformvalidation.set_rules('subject','Subject','required')>
<cfset objformvalidation.set_rules('posttext','Post Text','required')>

<cfif Trim(form.image1) NEQ ''>
	<cftry>
		<cffile action="upload" filefield="image1" destination="#imageDestination#" nameconflict="unique" result="uploadedImageFile1" accept="image/gif,image/jpg,image/jpeg,image/png">
		<cfset imagefile1=application.objimagegallery.renamefile(imageDestination,uploadedImageFile1.serverFile,uploadedImageFile1.serverFileExt)>
		<cfset imagefiles=listAppend(imagefiles,imagefile1)>
		<cfcatch type="any">
			<cfset objformvalidation.addError('Image 1 is not an accepted file format')>	
		</cfcatch>
	</cftry>
</cfif>

<cfif Trim(form.image2) NEQ ''>
	<cftry>
		<cffile action="upload" filefield="image2" destination="#application.pathprefix#/images" nameconflict="unique" result="uploadedImageFile2" accept="image/gif,image/jpg,image/jpeg,image/png">
		<cfset imagefile2=application.objimagegallery.renamefile(imageDestination,uploadedImageFile2.serverFile,uploadedImageFile2.serverFileExt)>
		<cfset imagefiles=listAppend(imagefiles,imagefile2)>
		<cfcatch type="any">
			<cfset objformvalidation.addError('Image 2 is not an accepted file format')>	
		</cfcatch>
	</cftry>
</cfif>

<cfif Trim(form.image3) NEQ ''>
	<cftry>
		<cffile action="upload" filefield="image3" destination="#application.pathprefix#/images" nameconflict="unique" result="uploadedImageFile3" accept="image/gif,image/jpg,image/jpeg,image/png">
		<cfset imagefile3=application.objimagegallery.renamefile(imageDestination,uploadedImageFile3.serverFile,uploadedImageFile3.serverFileExt)>
		<cfset imagefiles=listAppend(imagefiles,imagefile3)>
		<cfcatch type="any">
			<cfset objformvalidation.addError('Image 3 is not an accepted file format')>	
		</cfcatch>
	</cftry>
</cfif>
						
<cfif objformvalidation.isValidForm()>
	
	<cfif listlen(imagefiles) GT 0>
		<cfinvoke component="#application.objimagegallery#" method="findGallery" imagedsn="#application.dsn#" galleryname="Forum" returnvariable="classifiedGallery">
		<cfif classifiedGallery.recordcount GT 0>
			<cfset args=StructNew()>
			<cfset args.masterpath="#imageDestination#/">
			<cfloop list="#imagefiles#" index="thisimage">
				<cfset args.masterimage=thisimage>
				<cfloop from="1" to="#listlen(application.imagethumbs)#" index="i">
					<cfset args.thumbdir="#args.masterpath##listGetAt(application.imagethumbs,i)#/">
					<cfset args.imageWidth=listGetAt(application.imageThumbWidthList,i)>
					<cfset args.imageHeight=listGetAt(application.imageThumbHeightList,i)>
					<cfinvoke component="#application.objimagegallery#" method="createImageThumb" argumentcollection="#args#">
				</cfloop>
			</cfloop>
		</cfif>
	</cfif>
	
	<cfset args=StructNew()>
	<cfset args.ds=client.siteurl>
	<cfset args.postid=form.postid>
	<cfset args.subject=form.subject>
	<cfset args.posttext=form.posttext>
	<cftransaction>
		<cfinvoke component="#application.objforum#" method="editpost" argumentcollection="#args#">
	</cftransaction>
	<cfif isDefined('client.refererpage')>
		<cfset refererpage=client.refererpage>
		<cfset structdelete(client,"refererpage",false)>
	<cfelse>
		<cfset refererpage="/cms/content/forum/showposts/?t=#form.topicid#">
	</cfif>
	<cfinclude template="/actions/tracking.cfm">
	<cflocation url="#refererpage#" addtoken="false">
<cfelse>
	<cfset url.p=form.postid> 
</cfif>