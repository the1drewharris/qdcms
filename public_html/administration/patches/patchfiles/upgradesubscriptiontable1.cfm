<cfobject component="qdDataMgr" name="objqddatamgr">
<cfset ds=client.siteurl>
<cfset upgradeWasSuccessful=TRUE>
<cftry>
	<cfif objqddatamgr.columnExists(ds,'SUBSCRIPTION','SELLINGPRICE')>
		<cfquery name="dropcolumn" datasource="#ds#">
			ALTER TABLE SUBSCRIPTION DROP COLUMN SELLINGPRICE
		</cfquery>
	</cfif>
	<cfcatch type="any">
		<cfset upgradeWasSuccessful=FALSE>
	</cfcatch>
</cftry>