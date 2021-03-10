<cfinclude template="validategroupform.cfm">
<cfif thereAreNoErrorsInForm>
	<cfset form.contactdsn=client.siteurl>
	<cftransaction>
		<cfinvoke component="#application.abCFC#" method="addGroup" argumentCollection="#form#" returnVariable="groupid">
	</cftransaction>
	<cfinclude template="/actions/tracking.cfm">
	<cflocation url="/cms/crm/addressbook/showgroups" addtoken="false">
<cfelse>
	<cflocation url="#CGI.HTTP_REFERER#" addtoken="false">
</cfif>