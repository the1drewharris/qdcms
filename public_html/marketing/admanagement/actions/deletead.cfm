<cfset args=Structnew()>
<cfset args.adid=url.adid>
<cfset args.admanagementdsn=client.siteurl>
<cftransaction>
	<cfinvoke component="#application.objadmanagement#" method="deletead" argumentcollection="#args#">
</cftransaction>
<cfinclude template="/actions/tracking.cfm">
<cflocation url="#CGI.HTTP_REFERER#" addtoken="false">

