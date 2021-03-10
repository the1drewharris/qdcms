<cfoutput>
	<h1>Relate Question</h1> 
	<cfinvoke component="#application.objsurvey#" method="getsurveyquestions" surveydsn="#client.siteurl#" surveyid="#url.surveyid#" sort="1" displayinactive="0" onlywithanswerchoices="1" returnvariable="questions">
	<form id="form" action="/cms/#url.section#/#url.module#/#formaction#" method="post">
		<input type="hidden" name="surveyid" value="#url.surveyid#">
		<table id="webPageEditorTable"  class="htmform" cellpadding="3" >
		  	<tr>
				<td class="mainWebPageInfo">
					<fieldset>
						<label class="name" id="question">Select Primary Question
							<select name="questionid" onkeyup="populateAnswerChoices(this.value,'#url.surveyid#')" onclick="populateAnswerChoices(this.value,'#url.surveyid#')">
								<option value="0">Select...</option>
								<cfloop query="questions">
									<option value="#questionid#">#surveyquestion#</option>
								</cfloop>
							</select>
						</label>
						
						<div id="dynamic-selects">
						<div class="clear"></div>
						<label class="name" id="answerchoices">Select Answer Choice
							<select name="answerchoiceid">
								<option value="">Select ...</option>
							</select>
						</label>
						<div class="clear"></div>
						<label class="name" id="relatedquestion">Select the Related Question
							<select name="related_questionid">
								<option value="">Select ...</option>
							</select>
						</label>
						</div>
					</fieldset>
				</td>
				<td class="quickWebPageInfo">
					<div class="container">
						<cfinclude template="../display/rightcolumn.cfm">
					</div>
				</td>
		 	</tr>
		 	<tr>
		   		<td colspan="2" align="left">
					<input type="submit" name="Submit" value="Relate Questions" >
				</td>
		 	</tr>
		</table>
	</form>
</cfoutput>