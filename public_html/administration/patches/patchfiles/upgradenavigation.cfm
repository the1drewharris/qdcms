<cfset ds=client.siteurl>
<cfset upgradeWasSuccessful=TRUE>
<cftry>
	<cfinvoke component="#application.objbuildtables#" method="createWebPageTables" ds="#ds#">
	<cfquery name="upgrade" datasource="#ds#">
		ALTER TABLE NAVITEMS ALTER COLUMN SORTORDER INT
	</cfquery>
	<cfcatch type="any">
		<cfset upgradeWasSuccessful=FALSE>
	</cfcatch>
</cftry>