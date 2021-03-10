<cfset hourList = "01,02,03,04,05,06,07,08,09,10,11,12">
<cfset ttList ="AM,PM">
<cfoutput>
	<h1>#title#</h1>
	<form action="/cms/#url.section#/#url.module#/#formaction#" id="form" method="post">
		<input type="hidden" name="surveyid" value="#application.objtextconversion.setFormValue('surveyid')#">
		<table id="webPageEditorTable"  class="htmform" cellpadding="3" >
		  	<tr>
				<td class="mainWebPageInfo">
					<fieldset>
						<label class="name">Survey Name
				    		<input type="text" name="surveyname" value="#application.objtextconversion.setformValue('surveyname')#" />
						</label>
						<div class="single-line">
							<div class="justLabel">Start Time</div>
							<input type="text" id="startdate" name="sdate"  value="#application.objtextconversion.setFormValue('sdate')#">
							
							<select name="starthour">
								<cfset value=application.objtextconversion.setFormValue('starthour')>
								<cfloop list="#hourList#" index="hour">
									<option value="#hour#" <cfif value EQ hour>Selected</cfif>>#hour#</option>
								</cfloop>
							</select>
							
							<select name="startminute">
								<cfset value=application.objtextconversion.setFormValue('startminute')>
								<cfloop from="0" to="59" index="min">
									<cfif min LT 10>
										<cfset startmin="0#min#">
									<cfelse>
										<cfset startmin=min>
									</cfif>
									<option value="#startmin#" <cfif value EQ startmin>Selected</cfif>>#startmin#</option>
								</cfloop>
							</select>
							
							<select name="startampm">
								<cfset value=application.objtextconversion.setFormValue('startampm')>
								<cfloop list="#ttList#" index="ampm">
									<option <cfif value EQ ampm> selected</cfif>>#ampm#</option>
								</cfloop>
							</select>
						</div>
						<div class="clear"></div>
						
						<div class="single-line">
							<div class="justLabel">End Time</div>
							<input type="text" type="text" id="enddate" name="edate"  value="#application.objtextconversion.setFormValue('edate')#">
							<select name="endhour">
								<cfset value=application.objtextconversion.setFormValue('endhour')>
								<cfloop list="#hourList#" index="hour">
									<option value="#hour#" <cfif value EQ hour>selected</cfif>>#hour#</option>
								</cfloop>
							</select>
							
							<select name="endminute">
								<cfset value=application.objtextconversion.setFormValue('endminute')>
								<cfloop from="0" to="59" index="min">
									<cfif min LT 10>
										<cfset endmin="0#min#">
									<cfelse>
										<cfset endmin=min>
									</cfif>
									<option value="#endmin#" <cfif value EQ endmin>Selected</cfif>>#endmin#</option>
								</cfloop>
							</select>
							
							<select name="endampm">
								<cfset value=application.objtextconversion.setFormValue('endampm')>
								<cfloop list="#ttList#" index="ampm">
									<option <cfif value EQ ampm> selected</cfif>>#ampm#</option>
								</cfloop>
							</select>
						</div>
						<div class="clear"></div>
						
						<label class="name">Allowed number of survey from 1 IP
							<input type="text" name="numberoftimesfor1ip" value="#application.objtextconversion.setformvalue('numberoftimesfor1ip')#">
						</label>
						<label class="name">Allowed number of survey from 1 Registered User
							<input type="text" name="numberoftimesfornameid" value="#application.objtextconversion.setformvalue('numberoftimesfornameid')#">
						</label>
						<cfset selectallowenddate="">
						<cfset selectactive="">
						<cfif application.objtextconversion.setformvalue('allowenddate') EQ 1>
							<cfset selectallowenddate="Checked">
						</cfif>
						<cfif application.objtextconversion.setformvalue('active') EQ 1>
							<cfset selectactive="Checked">
						</cfif>
						
						<label class="checkbox">
							<input type="checkbox" name="allowenddate" value="1" #selectallowenddate#>Close Survey on End Date
						</label>
						<label class="checkbox">
							<input type="checkbox" name="active" value="1" #selectactive#>Activate This Survey
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
		   		<td>
					<input type="submit" name="Submit" value="Submit" >
				</td>
		 	</tr>
		</table>
	</form>
</cfoutput>