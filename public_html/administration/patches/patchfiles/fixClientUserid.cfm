<cfset ds=client.siteurl>
<cfset upgradeWasSuccessful=TRUE>
<cftry>
	<cfif listContainsNoCase('#ds#','jbfsale','.')>
		<cfquery name="updateClientUserid" datasource="#ds#">
		update NAME
	       set CLIENTUSERID = cast(floor(CLIENTUSERID) as int)
		</cfquery>
	</cfif>
	<cfcatch type="any">
		<cfset upgradeWasSuccessful=FALSE>
	</cfcatch>
</cftry>