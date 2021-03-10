<cfset ds=client.siteurl>
<cfset upgradeWasSuccessful=TRUE>
<cftry>
	<cfquery name="uniqueconstraint" datasource="#ds#">
		SELECT CONSTRAINT_NAME FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
		WHERE CONSTRAINT_NAME LIKE <cfqueryparam value="UQ%">
		AND TABLE_NAME=<cfqueryparam value="IDPOOL">
	</cfquery>
	<cfif uniqueconstraint.recordcount GT 0>
		<cfset k=uniqueconstraint.CONSTRAINT_NAME>
		<cfquery name="deleteconstraint" datasource="#ds#">
			ALTER TABLE IDPOOL DROP CONSTRAINT #k#
		</cfquery>
	</cfif>
	<cfcatch type="any">
		<cfset upgradeWasSuccessful=FALSE>
	</cfcatch>
</cftry>