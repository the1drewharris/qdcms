<!--- 
	1. Get info about the survey.
	2. Get all the Questions.
	3. Get all the answerchoices and count of answers for each answer choice
	4. Get all text answers
	5. Display the combination as report. 
--->
<cfparam name="url.surveyid" default="0">
<cfoutput>
	<cfif surveyid NEQ 0 and isNumeric(url.surveyid)>
		<cfinvoke component="#application.objsurvey#" method="getSurveyInfo" surveydsn="#client.siteurl#" surveyid="#url.surveyid#" returnvariable="surveyinfo">
		<cfif surveyinfo.recordcount GT 0>
			<cfinvoke component="#application.objsurvey#" method="getSurveyQuestions" surveydsn="#client.siteurl#" surveyid="#url.surveyid#" sort="1" returnvariable="questions">
			<h1>Report for survey: #surveyinfo.surveyname#</h1><br /><br />
			<cfloop query="questions">
				<b>#surveyquestion#</b> <br />
				<cfif noofanswerchoices GT 0>
					<cfinvoke component="#application.objsurvey#" method="getResult" surveydsn="#client.siteurl#" questionid="#questionid#" returnvariable="result">
					<cfloop from="1" to="#ArrayLen(result.results)#" index="i">
						<cfinvoke component="#Application.objsurvey#" method="getAnswer" returnvariable="answer" surveydsn="#client.siteurl#" answerid="#result.results[i][1]#">
						#answer#: #result.results[i][2]# <br />
					</cfloop>
				</cfif>
				
				<cfif textrequired EQ 1>
					<cfinvoke component="#application.objsurvey#" method="getTextAnswerCount" surveydsn="#client.siteurl#" questionid="#questionid#" returnvariable="textanswercount">
					<cfif textanswercount GT 0>
						<cfinvoke component="#application.objsurvey#" method="getAllTextAnswers" surveydsn="#client.siteurl#" questionid="#questionid#" noofresults="2" returnvariable="textanswers">
						<cfloop query="textanswers">
							#answer# <br /> <br />
						</cfloop>
						<cfif textanswercount GT 2>
							<a href="/cms/#url.section#/#url.module#/showtextanswers/?questionid=#questionid#">View All</a><br />
						</cfif>
					<cfelse>
						No one has answered this question.
					</cfif>
				</cfif>
				<br />
			</cfloop>
		<cfelse>
			No such survey
		</cfif>
	</cfif>
</cfoutput>