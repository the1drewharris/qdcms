<cfinvoke component="#application.objimagegallery#" method="findGallery" imagedsn="#client.siteurl#" galleryname="Address Book" returnvariable="abGallery">
<cfif abGallery.recordcount LTE 0>
	<cfinvoke component="#application.objimagegallery#" method="addGallery" imagedsn="#client.siteurl#" galleryname="Address Book" status="Private" returnvariable="galleryid">
	<cfset url.category=galleryid>
<cfelse>
	<cfset url.category=abGallery.galleryid>
</cfif>
	<!---
	url.c: imagecategoryid/galleryid
	url.d: database or site
	url.u: Masternameid
	--->
<cfset url.c=url.category>
<cfset url.d=client.siteurl>
<cfset url.u=client.masternameid>
<cfinclude template="/media/imagemgmt/actions/uploadimage.cfm">
<!--- needs url.category and returns imageid,thereWasNoFileUploadError --->
<cfif thereWasNoFileUploadError>
	<!--- <cftransaction> --->
		<cfinvoke component="#application.abCFC#" method="updateLogo" contactdsn="#client.siteurl#" nameid="#mynameid#" logoid="#imageid#">
	<!--- </cftransaction> --->
	<cfinclude template="/actions/tracking.cfm">
</cfif>