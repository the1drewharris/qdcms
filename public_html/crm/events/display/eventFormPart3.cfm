<cfoutput>
<div class="pricing">
	<dl id="pricingDL" class="slider">
		<dt id="pricingDT">Pricing and Registration <small>Optional</small></dt>
		<dd class="slideElement">
			<fieldset>
				<div class="single-line">
					<div class="multi-column1">
						<div class="justLabel">Standard Price</div>
						<input type="text" name="defaultprice" value="#application.objtextconversion.setFormValue('defaultprice')#">
					</div>
					
					<div class="multi-column1">
						<div class="justLabel">Guest Price</div>
						<input type="text" name="guestprice" value="#application.objtextconversion.setFormValue('guestprice')#">
					</div>
					<div class="multi-column1">
						<div class="justLabel">Discount Type</div>
						<select name="discountType" id="disc-type">
							<cfset value=application.objtextconversion.setFormValue('discountType')>
							<option value="Percentage" <cfif value EQ 'Percentage'>Selected</cfif>>Percentage</option>
							<option value="Price" <cfif value EQ 'Price'>Selected</cfif>>Price</option>
							<option value="None" <cfif value EQ 'None'>Selected</cfif>>None</option>
						</select>
					</div>
				</div>
				<div class="clear"></div>
				
				<div class="single-line">
					<div class="multi-column1">
						<div class="justLabel">Percentage Off</div>
						<input type="text" name="percentoff" value="#application.objtextconversion.setFormValue('percentoff')#">
					</div>
				</div>
				
				<div class="clear"></div>
				<div class="single-line">
					<div class="justLabel">Reg Start Time</div>
					<input type="text" type="text" id="regstart" name="regstartdate"  value="#application.objtextconversion.setFormValue('regstartdate')#">
					
					<select name="regstarthour">
						<cfset value=application.objtextconversion.setFormValue('regstarthour')>
						<cfloop list="#hourList#" index="hour">
							<option value="#hour#" <cfif value EQ hour>Selected</cfif>>#hour#</option>
						</cfloop>
					</select>
					
					<select name="regstartminute">
						<cfset value=application.objtextconversion.setFormValue('regstartminute')>
						<cfloop from="0" to="59" index="min">
							<cfif min LT 10>
								<cfset regstartmin="0#min#">
							<cfelse>
								<cfset regstartmin=min>
							</cfif>
							<option value="#regstartmin#" <cfif value EQ regstartmin>Selected</cfif>>#regstartmin#</option>
						</cfloop>
					</select>
					
					<select name="regstartampm" style="width:50px">
						<cfset value=application.objtextconversion.setFormValue('regstartampm')>
						<cfloop list="#ttList#" index="ampm">
							<option <cfif value EQ ampm>selected</cfif>>#ampm#</option>
						</cfloop>
					</select>
				</div>
				<div class="clear"></div>
				
				<div class="single-line">
					<div class="justLabel">End Time</div>
					<input type="text" type="text" id="regend" name="regenddate"  value="#application.objtextconversion.setFormValue('regenddate')#">
					
					<select name="regendhour">
						<cfset value=application.objtextconversion.setFormValue('regendhour')>
						<cfloop list="#hourList#" index="hour">
							<option value="#hour#" <cfif value EQ hour>Selected</cfif>>#hour#</option>
						</cfloop>
					</select>
					
					<select name="regendminute">
						<cfset value=application.objtextconversion.setFormValue('regendminute')>
						<cfloop from="0" to="59" index="min">
							<cfif min LT 10>
								<cfset regendmin="0#min#">
							<cfelse>
								<cfset regendmin=min>
							</cfif>
							<option value="#min#" <cfif value EQ regendmin>Selected</cfif>>#regendmin#</option>
						</cfloop>
					</select>
					
					<select name="regendampm">
						<cfset value=application.objtextconversion.setFormValue('regendampm')>
						<cfloop list="#ttList#" index="ampm">
							<option <cfif value EQ ampm> selected</cfif>>#ampm#</option>
						</cfloop>
					</select>
				</div>
				<div class="clear"></div>
			</fieldset>
		</dd>
	</dl>
</div>
<br /><div class="clear"></div>
</cfoutput>