<cfinclude template="validatealbumform.cfm">
<cfif thereAreNoErrorsInForm>
	<cfset form.imagedsn=client.siteurl>
	<cfset form.userid=client.masternameid>
	<cftransaction>
		<cfinvoke component="#application.objimagegallery#" method="updateGallery" argumentcollection="#form#">
	</cftransaction>
	<cfinclude template="/actions/tracking.cfm">
	<cflocation url="/cms/#url.section#/#url.module#/showalbums" addtoken="false">
<cfelse>
	<cflocation url="#CGI.HTTP_REFERER#" addtoken="false">
</cfif>