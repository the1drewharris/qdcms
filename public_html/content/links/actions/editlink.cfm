<cfinclude template="validateform.cfm">
<cfif thereAreNoErrorsInForm>
	<cfset form.ds=client.siteurl>
	<cfinvoke component="#application.objlinks#" method="updateLink" argumentcollection="#form#">
	<cfinclude template="/actions/tracking.cfm">
	<cflocation url="/cms/content/links/showlinks" addtoken="false">
<cfelse>
	<cflocation url="#CGI.HTTP_REFERER#" addtoken="false">
</cfif>