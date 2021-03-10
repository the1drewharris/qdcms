<cfset ds=client.siteurl>
<cfset upgradeWasSuccessful=TRUE>
<cftry>
	
	<cfquery name="fixZips" datasource="#ds#">
	update ADDRESS
	set ZIP = LEFT(zip,5)
	where LEN(zip) = 7
	</cfquery>

	<cfcatch type="any">
		<cfset upgradeWasSuccessful=FALSE>
	</cfcatch>
</cftry>