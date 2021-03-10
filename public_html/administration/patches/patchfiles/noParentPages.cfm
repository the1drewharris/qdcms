<cfset ds=client.siteurl>
<cfset upgradeWasSuccessful=TRUE>
<cfset patchname="noParentPages">
<cftry>
	<!--- do your thing here --->
	<cftransaction >
		<cfquery name="getNoParent" datasource="#ds#">
		SELECT
				WPVERSION.WPID,
				WPVERSION.NAME,
				WPVERSION.WPSTATUS,
				WPVERSION.AUTHORID,
				WPVERSION.CREATEDON,
				WPPARENT.PID AS PARENT,
				WPPARENT.NESTLEVEL,
				WPPARENT.SORTORDER
			FROM WPVERSION
			LEFT OUTER JOIN WPPARENT ON WPVERSION.WPID=WPPARENT.WPID
			WHERE CREATEDON = (SELECT MAX(CREATEDON) FROM UNIQUEWPID WHERE WPID=WPVERSION.WPID)
			AND WPVERSION.WPSTATUS <> 'deleted'
			AND WPPARENT.PID IS NULL
			ORDER BY WPPARENT.SORTORDER
		</cfquery>
		<cfoutput query="getNoParent">
			<cfquery name="addMissingParent" datasource="#ds#">
			INSERT INTO WPPARENT
			(PID,
			NESTLEVEL,
			SORTORDER,
			WPID)
			VALUES
			('0',
			'0',
			'0',
			'#wpid#')
			</cfquery>
		</cfoutput>
	</cftransaction>
	<cfcatch type="any">
		<cfset client.message="Patch #patchname# could not be applied due to error: #cfcatch.message#">
		<cfset upgradeWasSuccessful=FALSE>
	</cfcatch>
</cftry>