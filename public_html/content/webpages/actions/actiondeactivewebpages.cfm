<cftransaction>
	<cfloop list="#url.wpList#" index="id">
		<!--- <cfinvoke component="#application.objnavigation#" method="getNavItembyWPid" ds="#client.siteurl#" pageid="#id#" returnvariable="isInNav">
		<cfif isInNav.recordcount eq 0> --->
			<cfinvoke component="#application.objwebpage#" method="updateWPStatus" webdsn="#client.siteurl#" wpid="#id#" mystatus="Deactive">
		<!--- <cfelse>
			<cfset client.message="One or more of the web pages you have selected to delete were in a navigation, these web pages must first be removed from all navigations before they will be deleted.">
		</cfif> --->
	</cfloop>
</cftransaction>

<cfinclude template="/actions/tracking.cfm">

<cflocation url="/cms/content/webpages/viewWebPages" addToken="false"> 