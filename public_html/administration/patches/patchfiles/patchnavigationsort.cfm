<cfset ds=client.siteurl>
<cfset upgradeWasSuccessful=TRUE>
<cftry>
	<cfquery name="patch" datasource="#ds#">
		ALTER TABLE NAVITEMS ALTER COLUMN SORTORDER INT;
	</cfquery>
	<cfcatch type="any">
		<cfset upgradeWasSuccessful=FALSE>
	</cfcatch>
</cftry>