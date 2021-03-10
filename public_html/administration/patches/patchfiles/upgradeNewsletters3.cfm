<cfset ds=client.siteurl>
<cfset upgradeWasSuccessful=TRUE>
<cftry>
	<cftransaction>
		<cfinvoke component="#application.objbuildtables#" method="createEmailServersTables" ds="#ds#">
	</cftransaction>
	<cfcatch type="any">
		<cfset upgradeWasSuccessful=FALSE>
	</cfcatch>
</cftry>