<cftransaction>
	<cfinvoke component="#application.objforum#" method="deleteforum" ds="#client.siteurl#" forumlist="#url.forumlist#">
</cftransaction>
<cfinclude template="/actions/tracking.cfm">
<cflocation url="#CGI.HTTP_REFERER#" addtoken="false">