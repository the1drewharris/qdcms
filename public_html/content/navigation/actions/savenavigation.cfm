<cfparam name="form.navid" default="0">
<cfset navigationSetArray = deserializeJSON(form.m)>
<cftransaction>
	<cfinvoke component="#application.objnavigation#" method="addNavigation" ds="#client.siteurl#" status="#form.status#" name="#form.name#" authorid="#form.authorid#" navid="#form.navid#" returnVariable="navids">
	<cfset childInfo(navigationSetArray)>
</cftransaction>
<cfinclude template="/actions/tracking.cfm">

<cffunction name="childInfo" access="public" returntype="void" hint="I add a version of navigation">
	<cfargument name="navigationSet" required="true">
	<cfargument name="parentID" required="false" default="0">
	<cfargument name="count" required="false" default="0">
	<cfset prevSort = 0>
	<cfloop from="1" to="#arrayLen(navigationSet)#" index="i">
		<cfset count = count + 1>
		<cfif navigationSet[i].action NEQ 'remove'>
			<cfif listContainsNoCase(navigationSet[i].id,'item')>
				<cfset itemID = Replace(navigationSet[i].id,'item','')>			
				<cfset parentID = Replace(parentID,'item','')>
				<cfinvoke component="#application.objnavigation#" method="addNavigationItem" wpid="#itemID#" navid="#navids[1]#" sortorder="#count#" navverid="#navids[2]#" parentid="#parentID#" returnVariable="possibleParent" ds="#client.siteurl#">
				<cfif arrayLen(navigationSet[i].children)>
					<cfset childInfo(navigationSet[i].children,possibleParent)>
				</cfif>
			<cfelseif listContainsNoCase(navigationSet[i].id,'link')>
				<cfset itemID = Replace(navigationSet[i].id,'link','')>			
				<cfset parentID = Replace(parentID,'item','')>
				<cfinvoke component="#application.objnavigation#" method="addNavigationItem" linkid="#itemID#" navid="#navids[1]#" sortorder="#count#" navverid="#navids[2]#" parentid="#parentID#" returnVariable="possibleParent" ds="#client.siteurl#">
				<cfif arrayLen(navigationSet[i].children)>
					<cfset childInfo(navigationSet[i].children,possibleParent)>
				</cfif>
			</cfif>
			<cfset prevSort = i>
		</cfif>
	</cfloop>
	<cfreturn>
</cffunction>