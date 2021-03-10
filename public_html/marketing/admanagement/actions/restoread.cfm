<cfset args=StructNew()>
<cfset args.adid=url.adid>
<cfset args.admanagementdsn=client.siteurl>
<cftransaction>
	<cfinvoke component="#application.objadmanagement#" method="restoread" argumentcollection="#args#">
</cftransaction>
<cfinclude template="/actions/tracking.cfm">
<cflocation url="#CGI.HTTP_REFERER#" addtoken="false">