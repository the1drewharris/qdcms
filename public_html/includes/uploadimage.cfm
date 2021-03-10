<cfoutput>
	<cfset errorlog='#client.sitepath#/log.txt'>
	<cfset step="Step 1">
	<cfset myimage=application.objimagegallery.uploadImage("#client.sitepath#/images","filedata","jpg,gif,png,jpeg","2")>
	<cfif myimage.error EQ 0>
		<cftry>
			<cfset args=StructNew()>
			<cfset args.masterpath="#client.sitepath#/images/">
			<cfset args.masterimage=myimage.name>
			<cfloop from="1" to="#ListLen(application.imagethumbs)#" index="i">
				<cfset args.thumbdir="#args.masterpath##listGetAt(application.imagethumbs,i)#/">
				<cfset step='Step 2 #args.thumbdir#'>
				<cfset args.imageWidth=listGetAt(application.imageThumbWidthList,i)>
				<cfset args.imageHeight=listGetAt(application.imageThumbHeightList,i)>
				<cfinvoke component="#application.objimagegallery#" method="createImageThumb" argumentcollection="#args#">
			</cfloop>
			<cfset step="Step 3">
			<cftransaction>
				<cfinvoke component="#application.objimagegallery#" method="addImage" imagedsn="#client.siteurl#" userid="#client.masternameid#" imagename="#args.masterimage#" returnVariable="imageid">
				<cfinvoke component="#application.objimagegallery#" method="addImageToGallery" imagedsn="#client.siteurl#" userid="#client.masternameid#" imageid="#imageid#" galleryid="#form.c#">
			</cftransaction>
			<cfinclude template="/actions/tracking.cfm">
			<cfcatch type="any">
				<cffile action="append" file="#errorlog#" output="#cfcatch.message# #step# #myimage.name# #form.c#">
			</cfcatch>
		</cftry>
	</cfif>
</cfoutput>