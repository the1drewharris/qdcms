<cfoutput>
<div class="contact">
	<dl id="contactDL" class="slider">
		<dt id="contactDT">Contact <small>Optional</small></dt>
		<dd class="slideElement">
			<fieldset>
				<cfinvoke component="#Application.objEvent#" method="getEventContactGroup" eventdsn="#client.siteurl#" returnvariable="eventgroupid">
				<cfinvoke component="#application.abCFC#" method="getGroupContacts" contactdsn="#client.siteurl#" groupid="#eventgroupid#" returnvariable="EventGroup">
				<label class="name">Contact
					<select name="contactType" onkeyup="getInfo(this.value,'contact')" onclick="getInfo(this.value,'contact')">
						<cfset value=application.objtextconversion.setFormValue('contactType')>
						<option value="0">None</option>
						<option value="New" <cfif value EQ "New">Selected</cfif>>New contact</option>
						<cfloop query="EventGroup">
							<option value="#userid#" <cfif value EQ userid>Selected</cfif>>#firstname# #lastname# #address1# #wemail#</option>
						</cfloop>
					</select>
				</label>
				
				<div class="clear"></div>
				<em>*</em><small>Required only for new and existing contact<br/></small>
				<small>When Contact is None, the rest of this section will be ignored<br /><br /></small>
				
				<div class="single-line">
					<div class="multi-column1">
						<div class="justLabel">First Name<em>*</em></div>
						<input type="text" name="contactfirstname" id="contactfirstname" value="#application.objtextconversion.setFormValue('contactfirstname')#">
					</div>
					<div class="multi-column1">
						<div class="justLabel">Last Name<em>*</em></div>
						<input type="text" name="contactlastname" id="contactlastname" value="#application.objtextconversion.setFormValue('contactlastname')#">
					</div>
					<div class="multi-column1">
						<div class="justLabel">Phone</div>
						<input type="text" name="contactphone" id="contactphone" value="#application.objtextconversion.setFormValue('contactphone')#">
					</div>
				</div>
				
				<label class="name">Contact Email<em>*</em>
					<input type="text" name="contactemail" id="contactemail" value="#application.objtextconversion.setFormValue('contactemail')#"><br />
				</label>
				<label class="name">Address Line 1
					<input type="text" name="contactaddress1" id="contactaddress1" value="#application.objtextconversion.setFormValue('contactaddress1')#"><br />
				</label>
				<label class="name">Address Line 2
					<input type="text" name="contactaddress2" id="contactaddress2" value="#application.objtextconversion.setFormValue('contactaddress2')#"><br />
				</label>
				<div class="single-line">
					<div class="multi-column1">
						<div class="justLabel">City</div>
						<input type="text" name="contactcity" id="contactcity" value="#application.objtextconversion.setFormValue('contactcity')#">
					</div>
					<div class="multi-column1">
						<div class="justLabel">State</div>
						<select name="contactstate" id="contactstate">
							<cfset value=application.objtextconversion.setFormValue('contactstate')>
							<cfloop query="application.states">
								<option value="#stateid#" <cfif value EQ stateid>Selected</cfif>>#statename#</option>
							</cfloop>
						</select>
					</div>
					<div class="multi-column1">
						<div class="justLabel">Zip</div>
						<input type="text" name="contactzip" id="contactzip" value="#application.objtextconversion.setFormValue('contactzip')#">
					</div>
				</div>
			</fieldset>
		</dd>
	</dl>
</div>
<br /><div class="clear"></div>
</cfoutput>