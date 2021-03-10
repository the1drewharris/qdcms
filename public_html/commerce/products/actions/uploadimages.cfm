<cfset imagenames="">
<cfset destination="#client.sitepath#/images">

<cfif form.image1 NEQ ''>
	<cffile action="upload" filefield="image1" destination="#destination#" nameconflict="makeUnique" result="imageinfo">
	<cfset imagefile=application.objimagegallery.renamefile(destination,imageinfo.serverFile,imageinfo.serverFileExt)>
	<cfinclude template="/media/videomgmt/actions/createthumbs.cfm">
	<cfset imagenames=listAppend(imagenames,imagefile)>
</cfif>

<cfif form.image2 NEQ ''>
	<cffile action="upload" filefield="image2" destination="#destination#" nameconflict="makeUnique" result="imageinfo">
	<cfset imagefile=application.objimagegallery.renamefile(destination,imageinfo.serverFile,imageinfo.serverFileExt)>
	<cfinclude template="/media/videomgmt/actions/createthumbs.cfm">
	<cfset imagenames=listAppend(imagenames,imagefile)>
</cfif>

<cfif form.image3 NEQ ''>
	<cffile action="upload" filefield="image3" destination="#destination#" nameconflict="makeUnique" result="imageinfo">
	<cfset imagefile=application.objimagegallery.renamefile(destination,imageinfo.serverFile,imageinfo.serverFileExt)>
	<cfinclude template="/media/videomgmt/actions/createthumbs.cfm">
	<cfset imagenames=listAppend(imagenames,imagefile)>
</cfif>

<cfinvoke component="#application.objimagegallery#" method="findGallery" imagedsn="#client.siteurl#" galleryname="Products" returnvariable="productgallery">
<cfif productgallery.recordcount EQ 0>
	<cfinvoke component="#application.objimagegallery#" method="addGallery" imagedsn="#client.siteurl#" galleryname="Products" returnvariable="galleryid">
<cfelse>
	<cfset galleryid=productgallery.galleryid>
</cfif>
