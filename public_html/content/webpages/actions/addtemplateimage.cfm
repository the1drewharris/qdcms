<cftry>
	<cfset destination="#client.sitepath#/images/">
	<cfset result=Application.objimagegallery.uploadImage(destination,"Filedata",Application.allowedimagetypes)>
	<cfinvoke component="#Application.objimagegallery#" method="renameImage" oldimagename="#result.name#" filepath="#destination#" destinationpath="#destination#" siteurl="#client.siteurl#" returnvariable="newImageName">
	<cfset form.imagepath=newimagename>
	<cfinvoke component="#Application.objimagegallery#" method="findGallery" imagedsn="#client.siteurl#" galleryname="Webpage Templates" returnVariable="gallery">
	<cfif gallery.recordcount EQ 0>
		<cfset argsAddGallery=StructNew()>
		<cfset argsAddGallery.imagedsn=client.siteurl>
		<cfset argsAddGallery.galleryname="Webpage Templates">
		<cfset argsAddGallery.gallerydescription="Gallery for images related to Webpage Templates">
		<cfset argsAddGallery.status="Private">
		<cfinvoke component="#Application.objimagegallery#" method="addGallery" argumentcollection="#argsAddGallery#" returnvariable="galleryid">
	<cfelse>
		<cfset galleryid=gallery.galleryid>
	</cfif>
	<cfset noofthumbs=listLen(Application.imagethumbs)>
	<cfset args=structNew()>
	<cfset args.masterpath=destination>
	<cfset args.masterimage=newimagename>
	<cfloop from="1" to="#noofthumbs#" index="i">
		<cfset args.thumbdir="#destination##listGetAt(Application.imagethumbs,i)#/">
		<cfset args.imageWidth=listGetAt(Application.imageThumbWidthList,i)>
		<cfset args.imageHeight=listGetAt(Application.imageThumbHeightList,i)>
		<cfinvoke component="#application.objimagegallery#" method="createImageThumb" argumentcollection="#args#">
	</cfloop>
	<cfinvoke component="#Application.objimagegallery#" method="addImage" imagedsn="#client.siteurl#" userid="#client.masternameid#" imagename="#newimagename#" returnVariable="imageid">
	<cfinvoke component="#Application.objimagegallery#" method="addImageToGallery" imagedsn="#client.siteurl#" userid="#client.masternameid#" imageid="#imageid#" galleryid="#galleryid#">
	<cfinclude template="/actions/tracking.cfm">
	<cfcatch>
		<cfset client.message="There was error trying to upload the image. The image file may be corrupted">
		<cfdump var="#result#"><cfabort>
	</cfcatch>	
</cftry>