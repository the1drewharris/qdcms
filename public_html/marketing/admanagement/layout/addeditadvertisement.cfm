<cfinvoke component="#application.abCFC#" method="getCompanyAndNameid" returnvariable="companyAndNameid" contactdsn="#client.siteurl#">
<cfinvoke component="#application.objadmanagement#" method="getZones" returnvariable="Zones" admanagementdsn="#client.siteurl#">

<cfoutput>
	<h1>#title#</h1>
	<form action="/cms/marketing/admanagement/#formaction#" id="form" method="post" enctype="multipart/form-data">
		<cfset thisadid=application.objtextconversion.setformvalue('adid')>
		<input type="hidden" name="adid" value="#thisadid#">
		<input type="hidden" name="renewid" value="#application.objtextconversion.setformValue('renewid')#">
		<table id="webPageEditorTable"  class="htmform" cellpadding="3" >
		  	<tr>
				<td class="mainWebPageInfo">
					<fieldset>
						<label class="name">Advertisement Name
				    		<input type="text" name="adname" value="#application.objtextconversion.setformValue('adname')#" />
						</label>
						
						<cfset advertiser=application.objtextconversion.setformValue('advertiser_nameid')>
						<label class="name">Client
				    		<select name="advertiser_nameid">
								<cfloop query="companyAndNameid">
									<option value="#nameid#" <cfif nameid EQ advertiser>SELECTED</cfif>>#company#</option>
								</cfloop>
							</select>
						</label>
						
						<cfset thiszone=application.objtextconversion.setformValue('zoneid')>
						<label class="name">Zone
							<select name="zoneid">
								<cfloop query="Zones">
									<option value="#zoneid#" <cfif thiszone EQ zoneid>SELECTED</cfif>>#description#</option>
								</cfloop>
							</select>
						</label>
						
						<label class="name">Target URL
							<input type="text" name="target_url" value="#application.objtextconversion.setformValue('target_url')#">
						</label>
						
						<label class="name">Image
							<input type="file" name="uploadfile" size="63">
						</label>
		
						<label class="name">Display Text
							<input type="text" name="displaytext" value="#application.objtextconversion.setformValue('displaytext')#">
						</label>
						
						<div class="clear"></div>
						
						<div class="single-line">
							<cfset sh=application.objtextconversion.setformvalue('starthour')>
							<cfset sm=application.objtextconversion.setformvalue('startminute')>
							<cfset sampm=Application.objtextconversion.setFormValue('startampm')>
							<div class="multi-column6">
								Start Date<br />
								<input type="text" id="startdate" name="startdate" value="#application.objtextconversion.setformvalue('startdate')#" />
								<select name="starthour" rel="actual" id="starthour">
									<cfloop from="1" to="12" index="i">
										<cfif i LT 10><cfset hours="0#i#"><cfelse><cfset hours=i></cfif>
										<option value="#hours#" <cfif sh EQ hours>SELECTED</cfif>>#hours#</option>
									</cfloop>
								</select> 
								<select name="startminute" rel="actual" id="startminute">
									<cfloop from="0" to="59" index="i">
										<cfif i LT 10><cfset mins="0#i#"><cfelse><cfset mins=i></cfif>
										<option <cfif sm EQ mins>SELECTED</cfif>>#mins#</option>
									</cfloop>
								</select>
								<select name="startampm" rel="actual" id="startampm">
									<cfloop list="AM,PM" index="i">
										<option <cfif sampm EQ i>selected</cfif>>#i#</option>
									</cfloop>
								</select>
							</div>
							
							<cfset eh=application.objtextconversion.setformvalue('endhour')>
							<cfset em=application.objtextconversion.setformvalue('endminute')>
							<cfset eampm=Application.objtextconversion.setFormValue('endampm')>
							
							<div class="multi-column7">
								End Date<br />
								<input type="text" id="enddate" name="enddate" value="#application.objtextconversion.setformvalue('enddate')#" />
								<select name="endhour" rel="actual" id="endhour">
									<cfloop from="1" to="12" index="i">
										<cfif i LT 10><cfset hours="0#i#"><cfelse><cfset hours=i></cfif>
										<option value="#hours#" <cfif eh EQ hours>SELECTED</cfif>>#hours#</option>
									</cfloop>
								</select> 
								<select name="endminute" rel="actual" id="endminute">
									<cfloop from="0" to="59" index="i">
										<cfif i LT 10><cfset mins="0#i#"><cfelse><cfset mins=i></cfif>
										<option <cfif em EQ mins>SELECTED</cfif>>#mins#</option>
									</cfloop>
								</select>
								<select name="endampm" rel="actual" id="endampm">
									<cfloop list="AM,PM" index="i">
										<option <cfif eampm EQ i>selected</cfif>>#i#</option>
									</cfloop>
								</select>
							</div>
						</div>
						<div class="clear"></div> <br />
						
						<cfset mxClick=application.objtextconversion.setformvalue('maxclick')>
						<cfset mxImpression=application.objtextconversion.setformvalue('maximpression')>
						<cfif mxClick EQ ''><cfset mxClick='Unlimited'></cfif>
						<cfif mxImpression EQ ''><cfset mxImpression='Unlimited'></cfif>
						<label class="name">
							Maximum Click Allowed
							<input type="textfield" name="maxclick" value="#mxClick#"><br /><br />
						</label>
						
						<label class="name">
							Maximum Impression Allowed
							<input type="textfield" name="maximpression" value="#mxImpression#"><br /><br />
						</label>
						
						<label class="checkbox">
							<input type="checkbox" name="active" value="1" <cfif application.objtextconversion.setformvalue('active') EQ 1>Checked</cfif>>
							Activate this Advertisement
						</label>
						
						<label class="checkbox">
							<input type ="checkbox" name="check_date" value="1" <cfif application.objtextconversion.setformvalue('check_date') EQ 1>Checked</cfif>>
							Deactivate on Specified End Date<br />
						</label>
					</fieldset>
				</td>
				<cfinclude template="../display/displayad.cfm">
		 	</tr>
		 	<tr>
		   		<td colspan="2" align="left">
					<input type="submit" name="Submit" value="Update" >
				</td>
		 	</tr>
		</table>
	</form>
</cfoutput>