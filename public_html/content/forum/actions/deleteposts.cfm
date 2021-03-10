<cfparam name="client.pagetogo" default="0">
<cftransaction>
	<cfinvoke component="#application.objforum#" method="deleteposts" ds="#client.siteurl#" postList="#url.postList#">
</cftransaction>
<cfinclude template="/actions/tracking.cfm">
<cfif client.pagetogo EQ "0">
	<cflocation url="/cms/content/forum/" addtoken="false">
<cfelse>
	<cfset pagetogo=client.pagetogo>
	<cfset client.pagetogo="0">
	<cflocation url="#pagetogo#" addtoken="false">
</cfif>