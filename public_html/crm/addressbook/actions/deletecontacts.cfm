<cftransaction>
	<cfinvoke component="#application.abCFC#" method="deletecontacts" contactdsn="#client.siteurl#" contactlist="#url.contactlist#">
</cftransaction>
<cfinclude template="syncdeletecontacts.cfm">
<cfinclude template="/actions/tracking.cfm">
<cflocation url="#CGI.HTTP_REFERER#" addtoken="false">