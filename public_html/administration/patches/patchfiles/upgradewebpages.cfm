<!--- 
	Steps:
		1. Update Web Page Tables.
		2. Update WpParent table so that if a webpage does not have parent, ITS PID=0, NESTLEVEL=0 AND SORTORDER=SortOrderValue
		3. Get first generation to generation[1] 
		4. Update successive generations using breadth first search starting at generation 2
			4.1 Get second generation to generation[2]
			4.2 Update the nestlevel and sortorder of all the webpages in generation[2]
			4.3 Repeat for successive generations until the next generation in not present.
--->

Since you applied this upgrade in the existing system, you need to pass thisBranch=0 as a parameter to makeBranches function in component tree <br /> <br />

<cfset ds="#client.siteurl#">
<cfset upgradeWasSuccessful=TRUE>
<cfset generation=ArrayNew(1)>

BEGIN: STEP 1...
<cfinvoke component="#application.objbuildtables#" method="createWebPageTables" ds="#ds#">
DONE <br />
<cftry>
	<cftransaction>
		BEGIN: PRE STEP 2....
		<cfquery name="toplevelwp" datasource="#ds#">
			SELECT WPID FROM UNIQUEWPID WHERE WPID NOT IN (SELECT WPID FROM WPPARENT)
		</cfquery>
		DONE <br />
		
		BEGIN: STEP 2...
		<cfloop query="toplevelwp">
			<cfset sortordervalue=application.objtextconversion.convertNumberToSortCode(wpid)>
			<cfquery name="update1" datasource="#ds#">
				INSERT INTO WPPARENT
				(
					WPID,
					PID,
					NESTLEVEL,
					SORTORDER
				) 
				VALUES
				(
					<cfqueryparam value="#wpid#">,
					<cfqueryparam value="0">,
					<cfqueryparam value="0">,
					<cfqueryparam value="#sortordervalue#">
					
				)
			</cfquery>
		</cfloop>
		DONE <br />
		
		BEGIN: STEP 3...
		<cfquery name="getfirstgeneration" datasource="#ds#">
			SELECT WPID FROM WPPARENT WHERE PID=0
		</cfquery>
		<cfset generation[1]=valueList(getfirstgeneration.WPID)>
		DONE. <br />
		
		BEGIN: STEP 4...
		<cfloop from="2" to="15" index="i">
			<cfset j=i-1>
			<cfset generation[i]="">
			<cfquery name="nextgeneration" datasource="#ds#">
				SELECT
					WPID,
					PID,
					(SELECT SORTORDER FROM WPPARENT WHERE WPID=W.PID) AS PARENTSO
				FROM WPPARENT W
				WHERE PID IN (#generation[j]#)
			</cfquery>
			<cfif nextgeneration.recordcount GT 0>
				<cfset generation[i]=valueList(nextgeneration.WPID)>
				<cfloop query="nextgeneration">
					<cfset sortordervalue="#parentso#.#application.objtextconversion.convertNumberToSortCode(wpid)#">
					<cfquery name="update" datasource="#ds#">
						UPDATE WPPARENT SET
							NESTLEVEL=<cfqueryparam value="#j#">,
							SORTORDER=<cfqueryparam value="#sortordervalue#">
						WHERE WPID=<cfqueryparam value="#wpid#">
					</cfquery>
				</cfloop>
			<cfelse>
				<cfbreak>
			</cfif>
		</cfloop>
		DONE <br />
	</cftransaction>
	<cfcatch type="any">
		<cfset upgradeWasSuccessful=FALSE>
	</cfcatch>
</cftry>