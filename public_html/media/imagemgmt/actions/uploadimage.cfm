<!--- 
Important: 
	This file is used with swfupload. SWFUpload does not recognize Application, client and most probably session variables.
	When used such scoped variables throws -200 errror. Also tracking would not work because tracking uses application
	and client scoped variables.
	Terms
	url.c: imagecategoryid/galleryid
	url.d: database or site
	url.u: Masternameid
	
	In this case CGI.HTTP_REFERER is empty string. Therefore adding that will improve security
--->
<cfset thereWasNoFileUploadError=false>
<!--- <cfif CGI.HTTP_REFERER EQ ''> --->
	<cfoutput>
		<cfobject component="imagegallery" name="objimagegallery">
		<cfset imageThumbHeightList="112,60,90,300,500">
		<cfset imageThumbWidthList="122,60,90,300,500">
		<cfset imagethumbs="qdcms,tiny,small,large,detail"> 
		<cfset basepath="/home/drew/domains">
		<cfif listlen(url.d, ".") EQ 3>
			<cfset parent=listRest(url.d, ".")>
			<cfset subsite=listfirst(url.d, ".")>
			<cfset sitepath="#basepath#/#parent#/public_html/#subsite#">
		<cfelse>
			<cfset sitepath="#basepath#/#url.d#/public_html">
		</cfif>
		<cfset errorlog='#sitepath#/images/log.txt'>
		<cffile action="append" file="#errorlog#" output="fingers crossed">
		<cfset step="Step 1">
		<cfset myimage=objimagegallery.uploadImage("#sitepath#/images","filedata","jpg,gif,png,jpeg","2")>
		<cfif myimage.error EQ 0>
			<cftry>
				<cfset args=StructNew()>
				<cfset args.masterpath="#sitepath#/images/">
				<cfset args.masterimage=myimage.name>
				<cfloop from="1" to="#ListLen(imagethumbs)#" index="i">
					<cfset args.thumbdir="#args.masterpath##listGetAt(imagethumbs,i)#/">
					<cfset step='Step 2 #args.thumbdir#'>
					<cfset args.imageWidth=listGetAt(imageThumbWidthList,i)>
					<cfset args.imageHeight=listGetAt(imageThumbHeightList,i)>
					<cfinvoke component="#objimagegallery#" method="createImageThumb" argumentcollection="#args#">
				</cfloop>
				<cfset step="Step 3">
				<cftransaction>
					<cfinvoke component="#objimagegallery#" method="addImage" imagedsn="#url.d#" userid="#url.u#" imagename="#args.masterimage#" returnVariable="imageid">
					<cfif imageid neq "0">
						<cfset thereWasNoFileUploadError=true>
					</cfif>
					<cfinvoke component="#objimagegallery#" method="addImageToGallery" imagedsn="#url.d#" userid="#url.u#" imageid="#imageid#" galleryid="#url.c#">
				</cftransaction>
				<!--- <cfinclude template="/actions/tracking.cfm"> --->
				<cfcatch type="any">
					<cfset thereWasNoFileUploadError=false>
					<cffile action="append" file="#errorlog#" output="#cfcatch.message# #step# #myimage.name# #url.c#">
				</cfcatch>
			</cftry>
		</cfif>
	</cfoutput>
<!--- </cfif> --->