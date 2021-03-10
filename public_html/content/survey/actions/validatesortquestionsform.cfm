<cfobject component="formvalidation" name="objformvalidation">
<cfinvoke component="#application.objsurvey#" method="getsurveyquestions" surveydsn="#client.siteurl#" surveyid="#form.surveyid#" sort="1" returnvariable="questions">
<cfloop query="questions">
	<cfset objformvalidation.set_rules('q_#questionid#','Sort value for #surveyquestion#','required,numeric,min_val[1],max_val[#recordcount#]')>
</cfloop>
<cfinclude template="/actions/checkforerrorsinform.cfm">