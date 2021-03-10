<cfparam name="url.questionid" default="0">
<cfoutput>
	<cfif isNumeric(url.questionid) AND url.questionid GT 0>
		<cfinvoke component="#application.objsurvey#" method="getSingleQuestion" surveydsn="#client.siteurl#" questionid="#url.questionid#" returnvariable="questioninfo">
		<cfif questioninfo.recordcount EQ 1>
			<cfinvoke component="#application.objsurvey#" method="getSurveyInfo" surveydsn="#client.siteurl#" surveyid="#questioninfo.surveyid#" returnvariable="surveyinfo">
			<cfinvoke component="#application.objsurvey#" method="getAllTextAnswers" surveydsn="#client.siteurl#" questionid="#url.questionid#" returnvariable="alltextanswers">
			<h1>Survey: #surveyinfo.surveyname#</h1>
			<h2>Question: #questioninfo.surveyquestion#</h2>
			<cfloop query="alltextanswers">
				#answer# <br /><br />
			</cfloop>
		<cfelse>
			<cflocation url="/cms/#url.section#/#url.module#" addtoken="false">
		</cfif>
	<cfelse>
		<cflocation url="/cms/#url.section#/#url.module#" addtoken="false">
	</cfif>
</cfoutput>