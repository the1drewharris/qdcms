<cfset ds=client.siteurl>
<cfset upgradeWasSuccessful=TRUE>
<cfset patchname="toWebLead">
<cftry>
	<!--- do your thing here --->
	<cftransaction >
		<cfquery name="getAll" datasource="#ds#">
		SELECT NAMEID
		FROM NAME
		</cfquery>
		<cfquery name="getGroup" datasource="#ds#">
		SELECT USERGROUPID
		FROM USERGROUPS
		WHERE USERGROUPNAME LIKE '%web lead%'
		</cfquery>
		<cfif getGroup.recordcount eq 1>
			<cfset thegroupid=getGroup.usergroupid>
			<cfoutput query="getAll">
				<cfinvoke component="#application.abCFC#" method="addContactToGroup" contactdsn="#ds#" nameid="#nameid#" groupid="#thegroupid#" >
			</cfoutput>
		</cfif>
	</cftransaction>
	<cfcatch type="any">
		<cfset client.message="Patch #patchname# could not be applied due to error: #cfcatch.message#">
		<cfset upgradeWasSuccessful=FALSE>
	</cfcatch>
</cftry>