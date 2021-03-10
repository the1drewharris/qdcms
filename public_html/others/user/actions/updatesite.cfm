<cfinclude template="siteformvalidator.cfm">
<cfif thereAreNoErrorsInForm>
	<cfinvoke component="#application.objsite#" method="updatesite" argumentcollection="#form#">
	<cfset client.message="Your site settings have been updated.">
	<cflocation url="/cms/others/dashboard" addtoken="false">
<cfelse>
	<cflocation url="/cms/others/dashboard" addtoken="false">
</cfif>
