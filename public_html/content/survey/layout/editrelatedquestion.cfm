<cfparam name="url.r" default="0">
<cfinvoke component="#application.objsurvey#" method="getrelatedquestioninfo" surveydsn="#client.siteurl#" qrelationid="#url.r#" returnvariable="questioninfo">
<cfif questioninfo.recordcount GT 0>
	<cfinvoke component="#application.objsurvey#" method="getSurveyQuestions" surveydsn="#client.siteurl#" surveyid="#questioninfo.surveyid#" excludelist="#questioninfo.questionid#" returnvariable="questions">
	<cfinvoke component="#application.objsurvey#" method="getAnswerChoices" surveydsn="#client.siteurl#" questionid="#questioninfo.questionid#" returnvariable="answerchoices">
	<cfoutput>
		<h1>#title#</h1>
		<form action="/cms/#url.section#/#url.module#/#formaction#" id="form" method="post">
			<input type="hidden" name="surveyid" value="#questioninfo.surveyid#">
			<input type="hidden" name="qrelationid" value="#url.r#">
			<table id="webPageEditorTable"  class="htmform" cellpadding="3" >
			  	<tr>
					<td class="mainWebPageInfo">
						<fieldset>
							<label class="name">
								<h2>Question</h2>
								#questioninfo.surveyquestion#
							</label> <br /> <br />
							
							<label class="name"> Answer Choices
								<select name="answerchoiceid">
									<cfloop query="answerchoices">
									<option value="#answerchoiceid#" <cfif answerchoiceid EQ questioninfo.answerchoiceid>SELECTED</cfif>>#answer#</option>
									</cfloop>
								</select>
							</label>
							
							<label class="name"> Related Question
								<select name="related_questionid">
									<option value="#questioninfo.related_questionid#" Selected="TRUE">#questioninfo.related_question#</option>
									<cfloop query="questions">
									<option value="#questionid#">#surveyquestion#</option>
									</cfloop>
								</select>
							</label>
						</fieldset>
					</td>
					<td class="quickWebPageInfo">
						<div class="container">
						</div>
					</td>
			 	</tr>
			 	<tr>
			   		<td colspan="2">
						<input type="submit" name="Submit" value="Update" >
					</td>
			 	</tr>
			</table>
		</form>
	</cfoutput>
<cfelse>
	<cflocation url="/cms/#url.section#/#url.module#/showrelatedquestion/?surveyid=" addtoken="false">
</cfif>