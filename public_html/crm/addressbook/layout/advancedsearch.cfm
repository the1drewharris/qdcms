<cfinvoke component="#application.objevent#" method="getEventsWithGroupsAsssigned" eventdsn="#client.siteurl#" status="public" returnvariable="allevents">
<cfoutput>
	<h1>Advanced Search</h1>
	<form id="form" method="post" action="/cms/crm/addressbook/searchcontacts?t=a">
		<input type="hidden" name="ab" value="ab-advancedsearch">
		<table id="webPageEditorTable">
			<tr>
				<td class="mainWebPageInfo">
					<fieldset>
						<div class="single-line">
							<div class="multi-column1">
								<div class="justLabel">First Name</div>
								<input name="firstname" />
							</div>
							<div class="multi-column1">
								<div class="justLabel">Last Name</div>
								<input name="lastname" />
							</div>
							<div class="multi-column1">
								<div class="justLabel">Middle Name</div>
								<input name="middlename" />
							</div>
						</div>
						<div class="clear"></div>
						
						<label class="name">Company
							<input name="company" />
						</label>
						<div class="clear"></div>
						
						<label class="name">Title
							<input name="title" />
						</label>
						<div class="clear"></div>
						
						<div class="single-line">
							<div class="multi-column1">
								<div class="justLabel">Phone</div>
								<input name="phone" />
							</div>
							<div class="multi-column1">
								<div class="justLabel">Email</div>
								<input name="email" />
							</div>
							<div class="multi-column1">
								<div class="justLabel">Clientuserid</div>
								<input name="clientuserid" />
							</div>
						</div>
						<div class="clear"></div>
						
						<label class="name">Address Line 1
							<input name="address1" />
						</label>
						<div class="clear"></div>
						
						<label class="name">Address Line 2
							<input name="address2" />
						</label>
						<div class="clear"></div>
						
						<div class="single-line">
							<div class="multi-column1">
								<div class="justLabel">City</div>
								<input name="city" />
							</div>
							<div class="multi-column1">
								<div class="justLabel">State</div>
								<select name="state">
									<option value="">Select a state...</option>
									<cfloop query="application.states">
									<option value="#stateid#">#statename#</option>
									</cfloop>
								</select>
							</div>
							<div class="multi-column1">
								<div class="justLabel">Zip</div>
								<input name="zip" />
							</div>
						</div>
						<div class="clear"></div>
						
						<label class="name">Event
							<select name="eventid">
								<option value="0">Select an event...</option>
								<cfloop query="allevents">
									<option value="#eventid#">#eventname#</option>
								</cfloop>
							</select>
						 </label>
						 <div class="clear"></div>
						 
						 <div class="single-line">
							<div class="multi-column1">
								<div class="justLabel">Regd. Start</div>
								<input name="startdate" id="startdate" />
							</div>
							<div class="multi-column1">
								<div class="justLabel">Regd. End</div>
								<input name="enddate" id="enddate" />
							</div>
						</div>
						<div class="clear"></div>
						 
						<div class="single-line">
							<div class="multi-column1">
								<div class="justLabel">Facebook</div>
								<input name="facebook" />
							</div>
							<div class="multi-column1">
								<div class="justLabel">Twitter</div>
								<input name="twitter" />
							</div>
							<div class="multi-column1">
								<div class="justLabel">LinkedIn</div>
								<input name="linkedin" />
							</div>
						</div>
						<div class="clear"></div>
						
						<div class="single-line">
							<div class="multi-column1">
								<div class="justLabel">MySpace</div>
								<input name="myspace" />
							</div>
							<div class="multi-column1">
								<div class="justLabel">YouTube</div>
								<input name="youtube" />
							</div>
							<div class="multi-column1">
								<div class="justLabel">Plaxo</div>
								<input name="plaxo" />
							</div>
						</div>
						<div class="clear"></div>
						
						<div class="single-line">
							<div class="multi-column1">
								<div class="justLabel">FriendFeed</div>
								<input name="friendfeed" />
							</div>
						</div>
						<div class="clear"></div>
					</fieldset>
				</td>
				<td class="quickWebPageInfo">
					<cfinclude template="../display/groups.cfm">
					<input type="submit" name="submit" value="Submit">
				</td>
			</tr>
		</table>
	</form>
</cfoutput>