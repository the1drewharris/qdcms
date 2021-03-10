<!--- 
This patch was create to:
	1. CHANGE THE DATA TYPE OF COLUMN SENT TO VARCHAR(1) IN TABLE NEWSLETTER QUEUE 
--->

<cfset ds=client.siteurl>
<cfset upgradeWasSuccessful=TRUE>
<cftransaction>
	<cftry>
		<cfquery name="get" datasource="#ds#">
			SELECT O.NAME FROM SYSOBJECTS O 
			INNER JOIN SYSCOLUMNS C
			ON O.ID = C.CDEFAULT
			INNER JOIN SYSOBJECTS T
			ON C.ID = T.ID
			WHERE O.XTYPE = 'D'
			AND C.NAME = 'SENT'
			AND T.NAME = 'NEWSLETTERQUEUE'
		</cfquery>
		<cfif get.recordcount GT 0>
			<cfset constraintName=get.NAME>
			<cfquery name="removeConstraint" datasource="#ds#">
				ALTER TABLE NEWSLETTERQUEUE DROP CONSTRAINT #constraintName# 
			</cfquery>
		</cfif>
		<cfquery name="upgrade" datasource="#ds#">
			ALTER TABLE NEWSLETTERQUEUE ALTER COLUMN SENT VARCHAR(1);
		</cfquery>
		<cfcatch type="any">
			<cfset upgradeWasSuccessful=FALSE>
		</cfcatch>
	</cftry>
</cftransaction>