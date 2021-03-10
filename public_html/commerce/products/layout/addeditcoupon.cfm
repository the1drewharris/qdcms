<cfoutput>
	<cfset ttList ="AM,PM">
	<h1>#title#</h1>
	<form action="/cms/#url.section#/#url.module#/#formaction#" id="form" method="post">
		<input type="hidden" name="coupon" value="#application.objtextconversion.setFormValue('coupon')#">
		<table id="webPageEditorTable"  class="htmform" cellpadding="3" >
		  	<tr>
				<td class="mainWebPageInfo">
					<fieldset>
						<label class="name">
							No of Coupon to Generate
				    		<input type="text" name="noofcoupon" value="#application.objtextconversion.setformValue('noofcoupon')#" />
						</label>
						<label class="name">
							Custom Coupon Name (only if creating 1 coupon) *Must be unique
				    		<input type="text" name="couponCode" value="#application.objtextconversion.setformValue('couponCode')#" />
						</label>
						<label class="justLabel">Start Date</label>
						<input id="startdate" name="startdate" value="#application.objtextconversion.setformValue('startdate')#">
						<cfset thisSh=application.objtextconversion.setformvalue('starthour')>
						<select name="starthour">
							<cfloop from="1" to="12" index="h">
								<cfif h LT 10><cfset sh="0#h#"><cfelse><cfset sh=h></cfif>
								<option value="#sh#" <cfif sh EQ thisSh>Selected</cfif>>#sh#</option>
							</cfloop>
						</select>
						<cfset thisSm=application.objtextconversion.setformValue('startminute')>
						<select name="startminute">
							<cfloop from="0" to="59" index="m">
								<cfif m LT 10><cfset sm="0#m#"><cfelse><cfset sm=m></cfif>
								<option value="#sm#" <cfif sm EQ thisSm>Selected</cfif>>#sm#</option>
							</cfloop>
						</select>
						<cfset thisSap=application.objtextconversion.setformValue('startampm')>
						<select name="startampm">
							<cfloop list="#ttList#" index="sap">
								<option value="#sap#"<cfif sap EQ "thisSap">Selected</cfif>>#sap#</option>
							</cfloop>
						</select> 
						<div class="clear"></div> <br />
						
						<label class="justLabel">End Date</label>
						<input id="enddate" name="enddate" value="#application.objtextconversion.setformValue('enddate')#">
						<cfset thisEh=application.objtextconversion.setformvalue('endhour')>
						<select name="endhour">
							<cfloop from="1" to="12" index="h">
								<cfif h LT 10><cfset eh="0#h#"><cfelse><cfset eh=h></cfif>
								<option value="#eh#" <cfif eh EQ thisEh>Selected</cfif>>#eh#</option>
							</cfloop>
						</select>
						<cfset thisEm=application.objtextconversion.setformValue('endminute')>
						<select name="endminute">
							<cfloop from="0" to="59" index="m">
								<cfif m LT 10><cfset em="0#m#"><cfelse><cfset em=m></cfif>
								<option value="#em#" <cfif em EQ thisEm>Selected</cfif>>#em#</option>
							</cfloop>
						</select>
						<cfset thisEap=application.objtextconversion.setformValue('endampm')>
						<select name="endampm">
							<cfloop list="#ttList#" index="eap">
								<option value="#eap#"<cfif eap EQ "thisEap">Selected</cfif>>#eap#</option>
							</cfloop>
						</select> 
						<div class="clear"></div><br />
						<label class="name">No of times the coupoun can be used
							<input type="text" name="nooftimesallowed" value="#application.objtextconversion.setformValue('nooftimesallowed')#">
						</label>
					
						<label class="name">Discount Percent
							<input type="text" name="discountpercent" value="#application.objtextconversion.setformValue('discountpercent')#">
						</label>
						
						<label class="name">Discount Amount
							<input type="text" name="discount" value="#application.objtextconversion.setformValue('discount')#">
						</label>
						
						<label class="name">Discount applies to
							<select name="discountappliesto" onchange="showformfield(this.value)">
								<option value="1">Total Purchase</option>
								<option value="2">Video/Audio Category</option>
								<option value="3">Product Category (Non Video/Audio)</option>
								<option value="4">Any Item</option>
								<option value="5">Any non Video/Audio Product</option>
								<option value="6">Any Video/Audio Product</option>
								<option value="7">A Particular Video/Audio Item</option>
								<option value="8">A Particular Non Video/Audio Item</option>
							</select>
						</label>
						<div id="additionalinfo">
							<cfinclude template="../display/additionalinfo.cfm">
						</div>
					</fieldset>
				</td>
				<td class="quickWebPageInfo">
					<div class="container">
					</div>
				</td>
		 	</tr>
		 	<tr>
		   		<td colspan="2">
					<input type="submit" name="Submit" value="Submit" >
				</td>
		 	</tr>
		</table>
	</form>
</cfoutput>