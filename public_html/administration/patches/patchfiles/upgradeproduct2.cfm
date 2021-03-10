<cfset ds=client.siteurl>
<cfset upgradeWasSuccessful=TRUE>
<cfset patchname="Upgrade product 2">
<cftry>
	<cftransaction>
		<cfinvoke component="#application.objbuildtables#" method="createProductTables" ds="#ds#">
	</cftransaction>
	<cfcatch type="any">
		<cfset client.message="Patch #patchname# could not be applied due to error: #cfcatch.message#">
		<cfset upgradeWasSuccessful=FALSE>
	</cfcatch>
</cftry>