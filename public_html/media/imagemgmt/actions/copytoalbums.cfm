<cfset n=listlen(form.i)>
<cftransaction>
	<cfloop list="#form.i#" index="imageid">
		<cfloop list="#form.a#" index="galleryid">
			<cfinvoke component="#Application.objimagegallery#" method="addImageToGallery" imagedsn="#client.siteurl#" imageid="#imageid#" galleryid="#galleryid#" userid="1">
		</cfloop>
	</cfloop>
</cftransaction>
<cfinclude template="/actions/tracking.cfm">
<cfif n GT 1>
	<cfset item='images'>
<cfelse>
	<cfset item='image'>
</cfif>
<cfoutput>#n# #item# copied</cfoutput>
<!--- <cfabort> --->