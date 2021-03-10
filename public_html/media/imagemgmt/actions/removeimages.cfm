<cfparam name="url.l" default=""> <!--- list of images --->
<cfparam name="url.g" default="0"> <!--- image category id or gallery id --->

<!--- 
	Begin: Validation Part 
	Explanation: making sure that request is coming from viewalbum action is sufficient to verify that it is a valid request
	r: referer
	a: alternate referer
--->
<cfset allIsWell=FALSE>
<cfset r='http://#application.dsn#/cms/#url.section#/#url.module#/viewalbum/?id=#url.g#'>
<cfset a='http://www.#application.dsn#/cms/#url.section#/#url.module#/viewalbum/?id=#url.g#'>
<cfif (CGI.HTTP_REFERER EQ r) OR (CGI.HTTP_REFERER EQ a)>
	<cfset allIsWell=TRUE>	
</cfif>
<!--- End: Validation Part --->

<cfif allIsWell>
	<cftransaction>
		<cfinvoke component="#application.objimagegallery#" method="removeImagesFromGallery" imagedsn="#client.siteurl#" imagelist="#url.l#" galleryid="#url.g#">
	</cftransaction>
	<cfinclude template="/actions/tracking.cfm">
</cfif>

<cflocation url="#CGI.HTTP_REFERER#" addtoken="false">