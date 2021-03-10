<cfset ds=client.siteurl>
<cfset upgradeWasSuccessful=TRUE>
<cftry>
	do your thing here
	<cfcatch type="any">
		<cfset upgradeWasSuccessful=FALSE>
	</cfcatch>
</cftry>