<cfoutput>
	<h1>#action#</h1>
	<form name="frmadd" action="#formaction#" id="form" method="post">
		<input type="hidden" name="mynameid" value="#client.masternameid#" />
		<table id="webPageEditorTable"  class="htmform" cellpadding="3">
		  	<tr>
				<td class="mainWebPageInfo">
					<fieldset>
						<div class="single-line">
							<div class="multi-column1">
								<div class="justLabel">First Name<em>*</em></div>
								<input type="text" name="firstname" value="#application.objtextconversion.setformValue('firstname')#">
							</div>
							<div class="multi-column1">
								<div class="justLabel">Last Name<em>*</em></div>
								<input type="text" name="lastname" value="#application.objtextconversion.setformValue('lastname')#">
							</div>
							<div class="multi-column1">
								<div class="justLabel">Email<em>*</em></div>
								<input type="text" name="wemail" value="#application.objtextconversion.setformValue('wemail')#">
							</div>
						</div>
						
						<div class="clear"></div>
						<label class="name">Company
							<input type="text" name="company" value="#application.objtextconversion.setformValue('company')#">
						</label>
						
						<div class="clear"></div>
						<label class="name">Title
							<input type="text" name="title" value="#application.objtextconversion.setformValue('title')#">
						</label>
						
						<div class="clear"></div>
						<div class="single-line">
							<div class="multi-column1">
								<div class="justLabel">Username<em>*</em></div>
								<input type="text" name="myusername" value="#application.objtextconversion.setformValue('myusername')#">
							</div>
							<div class="multi-column1">
								<div class="justLabel">Password<em>*</em></div>
								<input type="password" name="mypassword" value="#application.objtextconversion.setformValue('mypassword')#">
							</div>
							<div class="multi-column1">
								<div class="justLabel">Confirm Password<em>*</em></div>
								<input type="password" name="confirm" value="#application.objtextconversion.setformValue('confirm')#">
							</div>
						</div>
						
						<div class="clear"></div>
						<label class="name">Address Line 1<em>*</em>
							<input type="text" name="address1" value="#application.objtextconversion.setformValue('address1')#">
						</label>
						
						<div class="clear"></div>
						<label class="name">Address Line 2
							<input type="text" name="address2" value="#application.objtextconversion.setformValue('address2')#">
						</label>
						
						<div class="clear"></div>
						<div class="single-line">
							<div class="multi-column1">
								<div class="justLabel">City<em>*</em></div>
								<input type="text" name="city" value="#application.objtextconversion.setformValue('city')#">
							</div>
							<div class="multi-column1">
								<div class="justLabel">State<em>*</em></div>
								<cfset stateselected=application.objtextconversion.setformValue('state')>
								<select name="state">
									<cfloop query="application.states">
										<option value="#stateid#" <cfif stateselected EQ stateid>Selected</cfif>>#statename#</option>
									</cfloop>
								</select>
							</div>
							<div class="multi-column1">
								<div class="justLabel">Zip<em>*</em></div>
								<input type="text" name="zip" value="#application.objtextconversion.setformValue('zip')#">
							</div>
						</div>
						
						<div class="clear"></div>
						<div class="single-line">
							<div class="multi-column1">
								<div class="justLabel">Home Phone<em>*</em></div>
								<input type="text" name="hphone" value="#application.objtextconversion.setformValue('hphone')#">
							</div>
							<div class="multi-column1">
								<div class="justLabel">Work Phone</div>
								<input type="phone" name="wphone" value="#application.objtextconversion.setformValue('wphone')#">
							</div>
							<div class="multi-column1">
								<div class="justLabel">Cell Phone</div>
								<input type="text" name="mphone" value="#application.objtextconversion.setformValue('fax')#">
							</div>
						</div>

					</fieldset>
				</td>
				
				<td class="quickWebPageInfo">
					<div class="container">
					</div>
				</td>
		 	</tr>
		 	<tr>
		   		<td colspan="2" align="left">
					<input type="submit" name="Submit" value="Submit">
				</td>
		 	</tr>
		</table>
	</form>
</cfoutput>