<cfset ds=client.siteurl>
<cfset upgradeWasSuccessful=TRUE>
<cfset patchname="updateMailServers">
<cftry>
	<!--- do your thing here --->
	<cftransaction >
		<cfquery name="set2Inactive" datasource="#ds#">
		UPDATE EMAILSERVERS
		SET STATUS = '0'
		WHERE SERVERNAME <> 'ns1.web-host.net'
		</cfquery>
		<cfquery name="check4ns1" datasource="#ds#">
		SELECT SERVERNAME
		FROM EMAILSERVERS
		WHERE SERVERNAME = 'ns1.web-host.net'
		</cfquery>
		<cfif check4ns1.recordcount eq 0>
			<cfquery name="addns1" datasource="#ds#">
			INSERT INTO EMAILSERVERS
				(SERVERNAME,
				PORT,
				USERNAME,
				PASSWORD,
				TOKEN,
				STATUS)
			VALUES
				('ns1.web-host.net',
				'25',
				'drew',
				'spidey01',
				'1',
				'1')
			</cfquery>
		<cfelse>
			<cfquery name="setns1Active" datasource="#ds#">
			UPDATE EMAILSERVERS
			SET STATUS = '1',
			USERNAME='drew',
			PASSWORD='spidey01',
			PORT='25'
			WHERE SERVERNAME = 'ns1.web-host.net'
			</cfquery>
		</cfif>
	</cftransaction>
	<cfcatch type="any">
		<cfset client.message="Patch #patchname# could not be applied due to error: #cfcatch.message#">
		<cfset upgradeWasSuccessful=FALSE>
	</cfcatch>
</cftry>