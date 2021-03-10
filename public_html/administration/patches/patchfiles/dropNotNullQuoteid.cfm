<cfset ds=client.siteurl>
<cfset upgradeWasSuccessful=TRUE>
<cfset patchname="dropNotNullQuoteID">
<cftry>
	<!--- do your thing here --->
	
	<cftransaction >
		<cfif application.objqddatamgr.columnExists('#ds#', 'COMMENT', 'BLOGENTRYID')>
			<cfquery name="dropNotNull" datasource="#ds#">
				ALTER TABLE COMMENT 
				DROP COLUMN QUOTEID;
				ALTER TABLE COMMENT
				ADD QUOTEID BIGINT NULL;
			</cfquery>
		</cfif>
	</cftransaction>
	<cfcatch type="any">
		<cfset client.message="Patch #patchname# could not be applied due to error: #cfcatch.message#">
		<cfset upgradeWasSuccessful=FALSE>
	</cfcatch>
</cftry>