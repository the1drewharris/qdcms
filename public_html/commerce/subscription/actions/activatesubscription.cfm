<cfparam name="url.s" default="0">
<cfif isNumeric(url.s) and url.s GTE 1>
	<cfset args.subscriptiondsn=client.siteurl>
	<cfset args.subscriptionid=url.s>
	<cfset args.nameid=312>
	<cftransaction>
		<cfinvoke component="#application.objsubscription#" method="activatesubscription" argumentcollection="#args#">
	</cftransaction>
	<cfinclude template="/actions/tracking.cfm">
</cfif>
<cflocation url="#CGI.HTTP_REFERER#" addtoken="false">