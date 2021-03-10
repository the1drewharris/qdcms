<cfset path = client.sitepath>
<cfset result = Application.objimagegallery.uploadImage("#path#/images","imagepath","jpg,gif,png,jpeg","3")>

<cfinvoke component="#Application.objimagegallery#" method="renameImage" oldImageName="#result['name']#" filepath="#path#/images" destinationpath="#path#/images" siteurl="#client.siteurl#" returnVariable="newImageName" />
<cfset result['name'] = newImageName>

<cfinvoke component="#Application.objimagegallery#" method="findGallery" imagedsn="#client.siteurl#" galleryname="Webpage Templates" returnVariable="gallery" />
<cfif gallery.recordCount EQ 0>
	<cfinvoke component="#Application.objimagegallery#" method="addGallery" imagedsn="#client.siteurl#" galleryname="Webpage Templates" gallerydescription="Gallery for images related to Webpage Templates">
</cfif>
<cfset galleryid = gallery.galleryid>

<cfset masterimage = result['name']>
<cfset masterpath = "#path#/images/">
<cfset thumbs = "qdcms,tiny,small,large,detail">
<cfset imageWidthList = "122,60,80,400,500">
<cfset imageHeightList = "112,60,80,400,500">
<cfset sourceImg = "#masterpath##masterimage#">

<cfloop from="1" to="#ListLen(thumbs)#" index="i">
	<cfinvoke component="#Application.objimagegallery#" method="createImageThumb" masterimage="#masterimage#" masterpath="#masterpath#"
	thumbdir="#path#/images/#listGetAt(thumbs,i)#/" imageWidth="#listGetAt(imageWidthList,i)#" imageHeight="#listGetAt(imageHeightList,i)#">
</cfloop>

<cfinvoke component="#Application.objimagegallery#" method="addImage" imagedsn="#client.siteurl#" userid="#client.masternameid#" imagename="#masterimage#" returnVariable="imageid">
<cfinvoke component="#Application.objimagegallery#" method="addImageToGallery" imagedsn="#client.siteurl#" userid="#client.masternameid#" imageid="#imageid#" galleryid="#galleryid#">