<cftransaction>
	<cfinvoke component="#application.abCFC#" method="restorecontacts" contactdsn="#client.siteurl#" contactlist="#url.contactlist#">
</cftransaction>
<cfinclude template="syncrestorecontacts.cfm">
<cfinclude template="/actions/tracking.cfm">
<cflocation url="#CGI.HTTP_REFERER#" addtoken="false">