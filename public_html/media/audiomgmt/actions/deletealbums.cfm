<cfparam name="url.l" default="0">
<cftransaction>
	<cfinvoke component="#application.objvideolib#" method="deletevideogalleries" videodsn="#client.siteurl#" gallerylist="#url.l#">
</cftransaction>
<cfinclude template="/actions/tracking.cfm">
<cflocation url="/cms/#url.section#/#url.module#/showvideoalbums" addtoken="false">