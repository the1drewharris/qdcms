<cfparam name="url.s" default="0">
<cfif isNumeric(url.s) AND url.s GTE 1>
	<cfset args=StructNew()>
	<cfset args.subscriptiondsn=Client.siteurl>
	<cfset args.subscriptionid=url.s>
	<cfset args.nameid=application.objsubscription.getSubscriber(client.siteurl,url.s)>
	<cftransaction>
		<cfinvoke component="#application.objsubscription#" method="cancelsubscription" argumentcollection="#args#">
	</cftransaction>
	<cfinclude template="/actions/tracking.cfm">
	<cflocation url="/cms/#url.section#/#url.module#/" addtoken="false">
</cfif>