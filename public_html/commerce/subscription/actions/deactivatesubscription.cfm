<cfparam name="url.s" default="0">
<cfif isNumeric(url.s) and url.s GTE 1>
	<cfset args=StructNew()>
	<cfset args.subscriptiondsn=client.siteurl>
	<cfset args.subscriptionid=url.s>
	<cfset args.nameid=312>
	<cftransaction>
		<cfinvoke component="#application.objsubscription#" method="deactivatesubscription" argumentcollection="#args#">
	</cftransaction>
	<cfinclude template="/actions/tracking.cfm">
</cfif>
<cflocation url="/cms/#url.section#/#url.module#/showactive" addtoken="false">