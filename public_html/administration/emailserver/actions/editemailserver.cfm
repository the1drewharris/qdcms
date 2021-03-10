<cfinclude template="validateemailserverform.cfm">
<cfif thereAreNoErrorsInForm>
	<cfset form.ds=client.siteurl>
	<cfinvoke component="#application.objnewsletter#" method="editEmailServer" argumentcollection="#form#">
	<cflocation url="/cms/#url.section#/#url.module#/showemailservers" addtoken="false"> 
<cfelse>
	<cflocation url="/cms/#url.section#/#url.module#/showemailservers" addtoken="false">
</cfif>