<cfinvoke component="#application.objsurvey#" method="getsurveyquestions" surveydsn="#client.siteurl#" surveyid="#url.surveyid#" sort="1" returnvariable="questions">
<cfif NOT thereAreErrors>
	<cfloop query="questions">
		<cfset session.formvalues['q_#questionid#']=currentRow>	
	</cfloop>
</cfif>