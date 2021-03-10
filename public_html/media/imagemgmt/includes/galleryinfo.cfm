<cfif NOT thereAreErrors>
	<cfparam name="url.id" default="0">
	<cfif isNumeric(url.id) AND url.id GT 0>
		<cfinvoke component="#application.objimagegallery#" method="getGalleryInfo" imagedsn="#client.siteurl#" galleryid="#url.id#" returnvariable="galleryinfo">
		<cfset Session.formValues['galleryname']=galleryinfo.imagecategory>
		<cfset Session.formValues['galleryid']=galleryinfo.imagecategoryid>
		<cfset Session.formValues['status']=galleryinfo.status>
		<cfset Session.formValues['gallerydescription']=galleryinfo.description>
	</cfif>
</cfif>