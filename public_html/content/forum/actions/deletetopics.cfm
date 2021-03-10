<cfparam name="client.pagetogo" default="0">
<cftransaction>
	<cfif len(url.topicList)>
		<cfinvoke component="#application.objforum#" method="deletetopics" ds="#client.siteurl#" topiclist="#url.topiclist#">
	</cfif>
</cftransaction>
<cfinclude template="/actions/tracking.cfm">

<cfif client.pagetogo EQ "0">
	<cflocation url="/cms/content/forum/" addtoken="false">
<cfelse>
	<cfset pagetogo=client.pagetogo>
	<cfset client.pagetogo="0">
	<cflocation url="#pagetogo#" addtoken="false">
</cfif>