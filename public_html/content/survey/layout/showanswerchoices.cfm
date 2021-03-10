<cfinvoke component="#application.objsurvey#" method="getAnswerChoices" surveydsn="#client.siteurl#" questionid="#url.q#" returnvariable="answerchoices">
<cfinvoke component="#application.objsurvey#" method="getQuestionAndSurveyName" surveydsn="#client.siteurl#" questionid="#url.q#" returnvariable="questioninfo"> 
<cfif answerchoices.recordcount GT 0>
	<cfoutput>
		<span class="left">
			<b>
				Survey: #questioninfo.surveyname# <br />
				Question: #questioninfo.surveyquestion#
			</b>
		</span>
		
		<span class="right">
			<br />
			<a href="/cms/content/survey/addanswerchoice/?q=#url.q#">+ Add Answer Choice</a>
		</span>
		<table class="datagrid" id="managePagesTable">
			<tr class="titlebar">
				<th>Answer</th>
				<th>Count</th>
			</tr>
			<cfloop query="answerchoices">
				<cfif currentRow MOD 2 EQ 0>
					<tr class="alt">
				<cfelse>
					<tr>
				</cfif>
				<td>
					<a href="/cms/#url.section#/#url.module#/editanswerchoice/?a=#answerchoiceid#" class="name">#answer#</a>			
				</td>
				<td>#RESULTCOUNT#</td>
			</cfloop>
		</table>
	</cfoutput>
<cfelse>
	<cflocation url="/cms/content/survey/showsurveys" addtoken="false">
</cfif>