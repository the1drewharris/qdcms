<cfset ds=client.siteurl>
<cfset upgradeWasSuccessful=TRUE>
<cfset patchname="buildDashboardTables">
<cftry>
	<!--- do your thing here --->
	<cftransaction >
		<cfinvoke component="#application.objbuildtables#" method="createDashboardTables" ds="#ds#">
	</cftransaction>
	<cfcatch type="any">
		<cfset client.message="Patch #patchname# could not be applied due to error: #cfcatch.message#">
		<cfset upgradeWasSuccessful=FALSE>
	</cfcatch>
</cftry>