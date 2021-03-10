<cfif isNumeric(url.s) AND url.s GTE 0>
	<cfset args=StructNew()>
	<cfset args.subscriptiondsn=Client.siteurl>
	<cfset args.subscriptionid=url.s>
	<cfset args.nameid=application.objsubscription.getSubscriber(client.siteurl,url.s)>
	<cftransaction>
		<cfinvoke component="#application.objsubscription#" method="revoke_cancellation" argumentcollection="#args#">
	</cftransaction>
	<cfinclude template="/actions/tracking.cfm">
	<cflocation url="/cms/#url.section#/#url.module#" addtoken="false">
</cfif>