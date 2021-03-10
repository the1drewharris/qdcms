<cfset ds=client.siteurl>
<cfset upgradeWasSuccessful=TRUE>
<cfset patchname="Adjust product categories">
<cftry>
	<cfset categories=Application.objproduct.getCategory(ds)>
	<cfloop query="categories">
		<cfset mysortcode=Application.objtextconversion.convertNumberToSortCode(CATEGORYID)>
		<cfif parentid EQ ''>
			<cfquery name="set" datasource="#ds#">
				UPDATE PRODUCTCATEGORY SET
					SORTORDER=<cfqueryparam value="#mysortcode#">,
					NESTLEVEL=<cfqueryparam value="1">
				WHERE CATEGORYID=<cfqueryparam value="#categoryid#">
			</cfquery>
		</cfif>
	</cfloop>
	<cfcatch type="any">
		<cfset client.message="Patch #patchname# could not be applied due to error: #cfcatch.message#">
		<cfset upgradeWasSuccessful=FALSE>
	</cfcatch>
</cftry>