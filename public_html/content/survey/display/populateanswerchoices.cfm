<cfinvoke component="#application.objsurvey#" method="getAnswerChoices" surveydsn="#client.siteurl#" questionid="#url.questionid#" returnvariable="answerchoices">
<cfinvoke component="#application.objsurvey#" method="getRelatedQuestions" surveydsn="#client.siteurl#" surveyid="#url.surveyid#" questionid="#url.questionid#" returnvariable="relatedQuestion">
<cfoutput>
<label class="name">Select Answer Choice
<select name="answerchoiceid">
	<cfloop query="answerchoices">
	<option value="#answerchoiceid#">#answer#</option>
	</cfloop>
</select>
</label>
<div class="clear"></div>
<cfinvoke component="#application.objsurvey#" method="getSurveyQuestions" surveydsn="#client.siteurl#" surveyid="#url.surveyid#" excludelist="#url.questionid#" returnvariable="questions">
<label class="name">Select Related Question
	<select name="related_questionid">
		<cfloop query="questions">
			<option value="#questionid#">#surveyquestion#</option>
		</cfloop>
	</select>
</label>
</cfoutput>