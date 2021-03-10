<cfset checkMultipleAnswersIf1="">
<cfset checkTextRequiredIf1="">
<cfset checkDisabledIf1="">
<cfinvoke component="#application.objsurvey#" method="getSurveyInfo" surveydsn="#client.siteurl#" surveyid="#url.surveyid#" returnvariable="thissurvey">
<cfif thissurvey.recordcount GT 0>
	<cfoutput>
		<h1>#thissurvey.surveyname#: #title#</h1>
		<form action="/cms/#url.section#/#url.module#/#formaction#" id="form" method="post">
			<cfif url.action EQ 'editquestion'>
				<input type="hidden" name="questionid" value="#url.q#">
			<cfelseif url.action EQ 'addquestion'>
				<input type="hidden" name="surveyid" value="#url.surveyid#">
			</cfif>
			<table id="webPageEditorTable"  class="htmform" cellpadding="3" >
			  	<tr>
					<td class="mainWebPageInfo">
						<fieldset>
							<label class="name">Survey Question
					    		<input type="text" name="question" value="#application.objtextconversion.setformValue('question')#" />
							</label><br />
							<cfif application.objtextconversion.setformvalue('multipleanswers') EQ 1>
								<cfset checkmultipleanswersif1="Checked">
							</cfif>
							<cfif application.objtextconversion.setformvalue('textrequired') EQ 1>
								<cfset checktextrequiredif1="Checked">
							</cfif>
							<cfif application.objtextconversion.setformvalue('disabled') EQ 1>
								<cfset checkDisabledIf1="Checked">
							</cfif>
							<input name="disabled" type="checkbox" value="1" #checkDisabledIf1#>Disabled
							<input name="multipleanswers" type="checkbox" value="1" #checkMultipleAnswersIf1#>Allow multiple answers
							<input name="textrequired" type="checkbox" value="1" #checkTextRequiredIf1#>Allow text as answer
							<br />				
						</fieldset>
					</td>
					<td class="quickWebPageInfo">
						<div class="container">
							<cfinclude template="../display/rightcolumn.cfm">
						</div>
					</td>
			 	</tr>
			 	<tr>
			   		<td>
						<input type="submit" name="Submit" value="Submit" >
					</td>
			 	</tr>
			</table>
		</form>
	</cfoutput>
<cfelse>
	<cflocation url="/cms/content/survey/showsurvey" addtoken="false">
</cfif>