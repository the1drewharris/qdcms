<cfset ds=client.siteurl>
<cfset upgradeWasSuccessful=TRUE>
<cfset patchname="correctSortOrder">
<cftry>
	<!--- do your thing here --->
	<cftransaction >
		<cfquery name="correctNestLevel" datasource="#ds#">
		UPDATE WPPARENT
		SET NESTLEVEL = '0'
		WHERE NESTLEVEL IS NULL
		</cfquery>
		<cfquery name="correctSortOrder" datasource="#ds#">
		UPDATE WPPARENT
		SET SORTORDER = '0'
		WHERE SORTORDER IS NULL
		</cfquery>
	</cftransaction>
	<cfcatch type="any">
		<cfset client.message="Patch #patchname# could not be applied due to error: #cfcatch.message#">
		<cfset upgradeWasSuccessful=FALSE>
	</cfcatch>
</cftry>