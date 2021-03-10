<cfif url.action EQ 'editanswerchoice'>
	<cfinvoke component="#application.objsurvey#" method="getAnswerChoiceInfo" surveydsn="#client.siteurl#" answerchoiceid="#url.a#" returnvariable="info">
	<cfif NOT thereAreErrors>
		<cfset session.formvalues['answerchoice']=info.answer>
		<cfset session.formvalues['answerchoiceid']=info.answerchoiceid>
		<cfset session.formvalues['questionid']=info.questionid>
	</cfif>
<cfelseif url.action EQ 'addanswerchoice'>
	<cfinvoke component="#application.objsurvey#" method="getQuestionAndSurveyName" surveydsn="#client.siteurl#" questionid="#url.q#" returnvariable="info">
	<cfif NOT thereAreErrors>
		<cfset session.formvalues['questionid']=info.questionid>
		<cfset session.formvalues['surveyid']=info.surveyid>
	</cfif>
</cfif>