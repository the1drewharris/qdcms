<cfset ds=client.siteurl>
<cfset upgradeWasSuccessful=TRUE>
<cfset patchname="hauNesting">
<cftry>
	<!--- do your thing here --->
	<cftransaction >
		<cfinvoke component="buildTables" method="createHauTables" ds="#ds#">
		<cfquery name="update" datasource="#ds#" >
			UPDATE HEARDABOUTUS
			SET SORTORDER = 0
			WHERE SORTORDER IS NULL;
			UPDATE HEARDABOUTUS
			SET NESTLEVEL = 0
			WHERE NESTLEVEL IS NULL;
		</cfquery>
	</cftransaction>
	<cfcatch type="any">
		<cfset client.message="Patch #patchname# could not be applied due to error: #cfcatch.message#">
		<cfset upgradeWasSuccessful=FALSE>
	</cfcatch>
</cftry>