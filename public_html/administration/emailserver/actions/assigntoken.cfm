<cfparam name="url.s" default="0"> <!--- serverid --->
<cftransaction>
	<cfinvoke component="#application.objnewsletter#" method="assignToken" ds="#client.siteurl#" serverid="#url.s#">
</cftransaction>
<cflocation url="#CGI.HTTP_REFERER#" addtoken="false">