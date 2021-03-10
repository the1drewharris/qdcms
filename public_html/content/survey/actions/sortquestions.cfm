<cfinclude template="validatesortquestionsform.cfm">
<cfif thereAreNoErrorsInForm>
	<cfset sortorderlist="">
	<cfset questionlist=valuelist(questions.questionid)>
	<cfloop query="questions">
		<cfset sortordervalue=Evaluate('form.q_#questionid#')*10>
		<cfset sortorderlist=listappend(sortorderlist,sortordervalue)>
	</cfloop>
	<cftransaction>
		<cfinvoke component="#application.objsurvey#" method="sortSurveyQuestions" surveydsn="#client.siteurl#" questionlist="#questionlist#" sortorderlist="#sortorderlist#">
	</cftransaction>
	<cfinclude template="/actions/tracking.cfm">
</cfif>
<cflocation url="#CGI.HTTP_REFERER#" addtoken="false">