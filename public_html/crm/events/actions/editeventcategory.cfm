<cfinclude template="validateeventcategoryform.cfm">
<cfif thereAreNoErrorsInForm>
	<cftransaction>
		<cfinvoke component="#application.objevent#" method="updateEventCat" argumentcollection="#form#" ds="#client.siteurl#">
	</cftransaction>
	<cfinclude template="/actions/tracking.cfm">
	<cflocation url="/cms/crm/events/listcategories" addtoken="false">
<cfelse>
	<cflocation url="#cgi.http_referer#" addtoken="false">
</cfif>