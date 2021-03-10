<cfinclude template="validatealbumform.cfm">
<cfif thereAreNoErrorsInForm>
	<cfset form.imagedsn=client.siteurl>
	<cftransaction>
		<cfinvoke component="#application.objimagegallery#" method="addGallery" argumentcollection="#form#" returnvariable="galleryid">
	</cftransaction>
	<cfinclude template="/actions/tracking.cfm">
	<cflocation url="/cms/#url.section#/#url.module#/showalbums/" addtoken="false">
<cfelse>
	<cflocation url="#CGI.HTTP_REFERER#" addtoken="false">
</cfif>