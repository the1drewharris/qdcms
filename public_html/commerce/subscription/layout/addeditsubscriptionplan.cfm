<cfoutput>
	<cfinvoke component="#application.objsubscription#" method="getTermMeasure" subscriptiondsn="#client.siteurl#" returnvariable="termmeasure">
	<cfinvoke component="#application.objproduct#" method="getSubscriable" productdsn="#client.siteurl#" returnvariable="subscriable">
	<h1>#title#</h1>
	<form action="/cms/#url.section#/#url.module#/#formaction#" id="form" method="post">
		<input type="hidden" name="subscriptionplanid" value="#application.objtextconversion.setformvalue('subscriptionplanid')#">
		<table id="webPageEditorTable"  class="htmform" cellpadding="3" >
		  	<tr>
				<td class="mainWebPageInfo">
					<fieldset>
						<cfset thisid=application.objtextconversion.setformvalue('subscriableid')>
						<label class="name">Subscriable Item
							<select name="subscriableid" onkeyup="showPlans(this.value)" onclick="showPlans(this.value)" <cfif url.action EQ 'editsubscriptionplan'>disabled="TRUE"</cfif>>
								<option value="">Select one...</option>
								<cfloop query="subscriable">
						    		<option value="#id#" <cfif thisid EQ id>Selected</cfif>>#itemname#</option>
						    	</cfloop>
				    		</select>
						</label>
						
						<label class="name">Name of the Plan
							<input type="text" name="itemname" value="#application.objtextconversion.setformvalue('itemname')#">
						</label>
						
						<label class="name">Term Value
							<input type="text" name="term" value="#application.objtextconversion.setformvalue('term')#">
						</label>
						
						<label class="name">Term Measure
							<cfset thisTermMeasure=application.objtextconversion.setformvalue('termmeasure')>
							<select name="termmeasure">
								<cfloop query="termmeasure">
									<option value="#termmeasure#" <cfif thisTermMeasure EQ termmeasure>Selected</cfif>>#termmeasure#</option>
								</cfloop>
							</select>
						</label>
						
						<cfset d=application.objtextconversion.setformvalue('startselling')>
						<cfif d EQ 1><cfset checkiftrue='checked'><cfelse><cfset checkiftrue=''></cfif>
						<label class="checkbox">
							<input type="checkbox" name="startselling" #checkiftrue# value="1">Start selling this subscription
						</label>
						<input type="hidden" name="usableminutes" value="0">
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