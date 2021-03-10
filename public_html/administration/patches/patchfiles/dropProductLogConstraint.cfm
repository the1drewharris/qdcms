<cfset ds=client.siteurl>
<cfset upgradeWasSuccessful=TRUE>
<cfset patchname="dropProductLogConstraint">
<cftry>
<cfinvoke component="qdDataMgr" method="getConstraintName" mydsn="#ds#" mytable="productlog" constraintType="FOREIGN KEY" returnvariable="myConstraint">
<cfif myConstraint.recordcount gt 0>
	<cfquery name="dropMyConstraint" datasource="#ds#">
	ALTER TABLE PRODUCTLOG DROP CONSTRAINT #myConstraint.CONSTRAINT_NAME#
	</cfquery>
</cfif>
	<cfcatch type="any">
		<cfset client.message="Patch #patchname# could not be applied due to error: #cfcatch.message#">
		<cfset upgradeWasSuccessful=FALSE>
	</cfcatch>
</cftry>