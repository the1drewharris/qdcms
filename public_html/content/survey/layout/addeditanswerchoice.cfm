<cfoutput>
	<h1>#title#</h1>
	<form action="/cms/#url.section#/#url.module#/#formaction#" id="form" method="post">
		<cfif url.action EQ 'addanswerchoice'>
			<input type="hidden" name="surveyid" value="#application.objtextconversion.setFormValue('surveyid')#">
		<cfelseif url.action EQ 'editanswerchoice'>
			<input type="hidden" name="answerchoiceid" value="#application.objtextconversion.setFormValue('answerchoiceid')#">
		</cfif>
		<input type="hidden" name="questionid" value="#application.objtextconversion.setFormValue('questionid')#">
		<table id="webPageEditorTable"  class="htmform" cellpadding="3" >
		  	<tr>
				<td class="mainWebPageInfo">
					<fieldset>
						<div class="heading">
							Survey Name: #info.surveyname# <br />
							Question: #info.surveyquestion#
							<cfif url.action EQ 'editanswerchoice'>
								<br />Old Answer Choice: #info.answer#
							</cfif>
						</div><br />
						<label class="name">
							Answer Choice
				    		<input type="text" name="answerchoice" value="#application.objtextconversion.setformValue('answerchoice')#" />
						</label>
					</fieldset>
				</td>
				<td class="quickWebPageInfo">
					<div class="container">
						<cfinclude template="../display/rightcolumn.cfm">
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