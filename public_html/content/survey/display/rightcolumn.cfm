<cfoutput>
	<cfif url.action EQ 'addsurvey'>
		<cfinvoke component="#application.objsurvey#" method="getSurveys" surveydsn="#client.siteurl#" all="1" returnvariable="surveys">
		<h4>Existing Surveys</h4>
		<cfloop query="surveys">
			<p>
				<a href="/cms/content/survey/editsurvey/?surveyid=#surveyid#">#surveyname#</a>
			</p>
		</cfloop>
	<cfelseif url.action EQ 'editquestion'>
		We will display something here.
	<cfelseif url.action EQ 'addanswerchoice'>
		We will display some info here.
	<cfelseif url.action EQ 'editanswerchoice'>
		We will display some info here.
	<cfelse>
		<h2>Brief Report</h2>
		<cfinvoke method="getBriefReport" surveydsn="#client.siteurl#" surveyid="#url.surveyid#" returnvariable="report">
		<cfif report.status NEQ 1>
		This survey is Deleted <br />
		</cfif>
		No of Questions: #report.noofquestions# <br />
		No of People Surveyed: #report.noofpeoplesurveyed# <br />
		Total Entries: #report.noofentries#
	</cfif>
</cfoutput>

<!--- This should be moved to cfc --->
<cffunction name="getBriefReport" access="public" returntype='query' hint="returns summary for survey">
	<cfargument name="surveydsn" type="string" required="true" hint="data source">
	<cfargument name="surveyid" type="string" required="true" hint="id of the survey">
	<cfset var get=0>
	<cfquery name="get" datasource="#arguments.surveydsn#">
		SELECT 
			STATUS,
			(SELECT COUNT(QUESTIONID) FROM QUESTIONS WHERE SURVEYID=<cfqueryparam value="#arguments.surveyid#">) AS NOOFQUESTIONS,
			(SELECT COUNT(QUESTIONID) FROM QUESTIONS WHERE SURVEYID=<cfqueryparam value="#arguments.surveyid#"> AND DISPLAY=1) AS NOOFLIVEQUESTIONS,
			(SELECT COUNT(DISTINCT NAMEID) FROM PEOPLESURVEYED WHERE SURVEYID=<cfqueryparam value="#arguments.surveyid#"> AND NAMEID IS NOT NULL) as NOOFPEOPLESURVEYED,
			(SELECT COUNT(PEOPLESURVEYEDID) FROM PEOPLESURVEYED WHERE SURVEYID=<cfqueryparam value="#arguments.surveyid#">) AS NOOFENTRIES
		FROM SURVEY
		WHERE SURVEYID=<cfqueryparam value="#arguments.surveyid#">	
	</cfquery>
	<cfreturn get>
</cffunction>