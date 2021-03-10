<cfif questions.recordcount GT 0>
	<cfinvoke component="#application.objsurvey#" method="getsurveyinfo" surveydsn="#client.siteurl#" surveyid="#url.surveyid#" returnvariable="surveyinfo">
	<cfoutput>
		<h1 style="float:left">Questions for Survey: #surveyinfo.surveyname#</h1>
		<span class="right">
			<a href="/cms/content/survey/addquestion/?surveyid=#url.surveyid#" id="addSurvey" title="Add new survey">+ Add Question</a>
		</span>
		<table class="datagrid" id="managePagesTable">
			<tr class="titlebar">
				<th></th>
				<th>Question</th>
				<th>Answer in Text</th>
				<th>Multiple Answers</th>
				<th>Disabled</th>
				<th>Answer Options</th>
				<th></th>
			</tr>
			<form id="form" method="post" action="/cms/#url.section#/#url.module#/actionsortquestions">
			<input type="hidden" name="surveyid" value="#url.surveyid#">
			<cfloop query="questions">
				<cfif currentRow MOD 2 EQ 0><tr class="alt"><cfelse><tr></cfif>
					<td>
						<input type="text" name="q_#questionid#" value="#application.objtextconversion.setFormValue('q_#questionid#')#" size="1">
					</td>
					<td>
						<cfinvoke component="#Application.objsurvey#" method="getResult" returnvariable="result" surveydsn="#client.siteurl#" questionid="#questionid#">
						<cfset noOfPeopleAnsweredThisQuestion=0>
						<cfset editAllowed=FALSE>
						<cfsavecontent variable="thissurveyresults">
							<cfloop from="1" to="#ArrayLen(result.results)#" index="i">
								<cfinvoke component="#Application.objsurvey#" method="getAnswer" returnvariable="answer" surveydsn="#client.siteurl#" answerid="#result.results[i][1]#">
								#answer#: #result.results[i][2]#<br />
								<cfset noOfPeopleAnsweredThisQuestion=noOfPeopleAnsweredThisQuestion + result.results[i][2]>
							</cfloop>	
						</cfsavecontent>
						<cfif noOfPeopleAnsweredThisQuestion EQ 0>
							<cfif textrequired EQ 1>
								<cfinvoke component="#application.objsurvey#" method="getTextAnswerCount" surveydsn="#client.siteurl#" questionid="#questionid#" returnvariable="textanswercount">
								<cfif textanswercount EQ 0>
									<cfset editAllowed=TRUE>
								</cfif>
							<cfelse>
								<cfset editAllowed=TRUE>
							</cfif>
						</cfif>
						<cfif editAllowed>
							<a href="/cms/content/survey/editquestion/?q=#questionid#" class="name">#surveyquestion#</a>
						<cfelse>
							#surveyquestion#
						</cfif><br />
						#thissurveyresults#
					</td>
					<td><cfif textrequired EQ 1>YES<cfelse>NO</cfif></td>
			  		<td><cfif multipleanswers EQ 1>YES<cfelse>NO</cfif></td>
					<td><cfif display EQ 0>YES<cfelse>NO</cfif></td>
					<td>
						<a href="/cms/content/survey/addanswerchoice/?q=#questionid#">Add</a> 
						<cfif noofanswerchoices GT 1> | <a href="/cms/content/survey/showanswerchoices/?q=#questionid#">Show(#noofanswerchoices#)</a></cfif>
					</td>
					<td><cfif editAllowed><a href="/cms/content/survey/deletequestion/?q=#questionid#">Delete</a></cfif></td>
				</tr>
			</cfloop>
			<tr>
				<td colspan="7">
				<input type="submit" name="submit" value="Submit">
				</td>
			</tr>
			</form>
		</table> 
	</cfoutput>
<cfelse>
	<div class="quicknote">
		<h2>There are no questions for this survey</h2>
	</div>
</cfif>