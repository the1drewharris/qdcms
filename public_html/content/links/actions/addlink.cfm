<cfinclude template="validateform.cfm">
<cfif thereAreNoErrorsInForm>
	<cfset form.ds=client.siteurl>
	<cfinvoke component="#application.objlinks#" method="addLink" argumentcollection="#form#" returnvariable="newLinkid">
	<cfinclude template="/actions/tracking.cfm">
	<cflocation url="/cms/content/links/addlink" addToken="false">
<cfelse>
	<cflocation url="#CGI.HTTP_REFERER#" addtoken="false">
</cfif>