<cfoutput>
<div class="location">
	<dl id="locationDL" class="slider">
		<dt id="locationDT">Location <small>Optional</small></dt>
		<dd class="slideElement">
			<fieldset>
				<cfinvoke component="#Application.objEvent#" method="getEventLocationGroup" eventdsn="#client.siteurl#" returnvariable="groupid">
				<cfinvoke component="#application.abCFC#" method="getGroupContacts" contactdsn="#client.siteurl#" groupid="#groupid#" returnvariable="locationGroup">
				<cfset selected=FALSE>
				<label class="name">Location
					<select name="locationType" onkeyup="getInfo(this.value,'location')" onclick="getInfo(this.value,'location')">
						<cfset value=application.objtextconversion.setFormValue('locationType')>
						<option value="0">None</option>
						<option value="New" <cfif value EQ "New">Selected</cfif>>New Location</option>
						<cfloop query="locationGroup">
							<option value="#userid#" <cfif value Eq userid>Selected</cfif>>#company#</option>
						</cfloop>
					</select>
				</label>
				<div class="clear"></div>
				<em>*</em><small>Required only for new and existing location<br/></small>
				<small>When Location is None, the rest of this section will be ignored <br /><br /></small>
				<div class="single-line">
					<div class="multi-column1">
						<div class="justLabel">Location Name <em>*</em></div>
						<input type="text" name="locationname" id="locationname" value="#application.objtextconversion.setFormValue('locationname')#">
					</div>
					<div class="multi-column1">
						<div class="justLabel">Location Email</div>
						<input type="text" name="locationemail" id="locationemail" value="#application.objtextconversion.setFormValue('locationemail')#">
					</div>
					<div class="multi-column1">
						<div class="justLabel">Location Phone</div>
						<input type="text" name="locationphone" id="locationphone" value="#application.objtextconversion.setFormValue('locationphone')#">
					</div>
				</div>
				<label class="name">Address Line 1<em>*</em>
					<input type="text" name="locationaddress1" id="locationaddress1" value="#application.objtextconversion.setFormValue('locationaddress1')#"><br />
				</label>
				<label class="name">Address Line 2<em>*</em>
					<input type="text" name="locationaddress2" id="locationaddress2" value="#application.objtextconversion.setFormValue('locationaddress2')#"><br />
				</label>
				<div class="single-line">
					<div class="multi-column1">
						<div class="justLabel">City<em>*</em></div>
						<input type="text" name="locationcity" id="locationcity" value="#application.objtextconversion.setFormValue('locationcity')#">
					</div>
					<div class="multi-column1">
						<div class="justLabel">State<em>*</em></div>
						<select name="locationstate" id="locationstate">
							<cfset value=application.objtextconversion.setFormValue('locationstate')>
							<cfloop query="application.states">
								<option value="#stateid#" <cfif value EQ stateid>Selected</cfif>>#statename#</option>
							</cfloop>
						</select>
					</div>
					<div class="multi-column1">
						<div class="justLabel">Zip<em>*</em></div>
						<input type="text" name="locationzip" id="locationzip" value="#application.objtextconversion.setFormValue('locationzip')#">
					</div>
				</div>
			</fieldset>
			
		</dd>
	</dl>
</div>
<br /><div class="clear"></div>
</cfoutput>