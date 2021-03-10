<cfset ds=client.siteurl>
<cfset upgradeWasSuccessful=TRUE>
<cfset patchname="">
<cftry>
	<!--- do your thing here --->
	<cfcatch type="any">
		<cfset client.message="Patch #patchname# could not be applied due to error: #cfcatch.message#">
		<cfset upgradeWasSuccessful=FALSE>
	</cfcatch>
</cftry>