<cfset itIsaValidSite=application.objsite.isSiteId(url.siteid)>
<cfset siteIsMigrated=FALSE>
<cfif itIsaValidSite>
	<cfset itIsaLegacySite=application.objsite.isLegacySite(url.siteid)>
	<cfif itIsaLegacySite>
		<cfset mysiteurl=application.objsite.getSiteUrl(url.siteid)>
		<cfset systemId=application.objsite.getSystemId(url.siteid)>
		<cftry>
<!---
			<cfinvoke component="#application.objbuildtables#" method="buildAllTables" ds="#mysiteurl#">

			<cfinclude template="undeletecontacts.cfm">
			<cfinclude template="addnavigation.cfm">

			<cfinclude template="addheadergalleries.cfm">

			<cftransaction>
				<cfinclude template="migratefiles.cfm">
			</cftransaction>

			<cftransaction>
				<cfinclude template="migratepages.cfm">
			</cftransaction>


			<cfinclude template="migrateimages.cfm">

--->
			<cftransaction>
				<cfinclude template="migratepages.cfm">
			</cftransaction>

			<cfif mysiteurl EQ "fishonok.com">
				<cfset client.message="Migrating Legacy Blog">
				<cfinclude template="migrateblogs.cfm">
			</cfif>


			<cfset client.message="#mysiteurl# has been converted">
			<cfset siteIsMigrated=TRUE>

			<cfcatch type="any">
				<cfset client.message=cfcatch.message & " Error occured while " & client.message & " To run this process again for the #mysiteurl#, please disable the parts of code that has been done.">
			</cfcatch>
		</cftry>
	<cfelse>
		<cfset client.message="That was not a legacy site">
	</cfif>
<cfelse>
	<cfset client.message="That was not a valid site">
</cfif>

<cfif siteIsMigrated>
	<cfinvoke component="#application.objsite#" method="SetSiteAsUpgraded" siteid="#url.siteid#">
</cfif>

<cflocation url="/cms/administration/site/showsites" addtoken="false">