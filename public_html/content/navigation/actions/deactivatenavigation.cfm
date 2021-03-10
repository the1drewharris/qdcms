<cfparam name="url.navid" default="0">
<cfif isNumeric(url.navid)>
	<cftransaction>
		<cfinvoke component="#application.objnavigation#" method="modifyNavigationStatus" ds="#client.siteurl#" navid="#url.navid#" status="0">
	</cftransaction>
	<cfinclude template="/actions/tracking.cfm">
</cfif>
<cflocation url="/cms/content/navigation" addtoken="false">