<cfset ds=client.siteurl>
<cfset upgradeWasSuccessful=TRUE>

<cfset args=StructNew()>
<cfset args.ds=client.siteurl>
<cfset args.timedate=application.objtimedateconversion.createtimedate()>

<cfobject component="franchiseApp" name="objfranchiseapp">
<cftry>
	<cfinvoke component="#application.objbuildtables#" method="createApplicationTables" ds="#ds#">
	<cfquery name="submitted" datasource="#ds#">
		SELECT 
			EMAIL,
			1 AS SUBMITTED 
		FROM 
		SAVEDAPPLICATION WHERE EMAIL IN (SELECT WEMAIL FROM PERSONALINFO)
	</cfquery>
	
	<cfquery name="notsubmitted" datasource="#ds#">
		SELECT 
			EMAIL,
			0 AS SUBMITTED
		FROM SAVEDAPPLICATION WHERE EMAIL NOT IN (SELECT WEMAIL FROM PERSONALINFO)
	</cfquery>
	
	<cfquery name="applicants" dbtype="query">
		SELECT EMAIL, SUBMITTED FROM SUBMITTED
		UNION
		SELECT EMAIL, SUBMITTED FROM NOTSUBMITTED
	</cfquery>
	<cftransaction>
		<cfloop query="applicants">
			<cfset args.email=email>
			<cfif submitted EQ 1>
				<cfset args.remarks="Submitted">
			<cfelse>
				<cfset args.remarks="Not Submitted">
			</cfif>
			<cfinvoke component="#objfranchiseapp#" method="recordtracking" argumentcollection="#args#">
		</cfloop>
	</cftransaction>
	<cfcatch type="any">
		<cfset upgradeWasSuccessful=FALSE>
	</cfcatch>
</cftry>