<cfinvoke component="#Application.abCFC#" method="getGroupInfo" contactdsn="#client.siteurl#" returnVariable="GroupInfo" />
<cfoutput>
	<h1>#title#</h1>
	<form id="form" method="post" action="/cms/crm/addressbook/#formaction#">
		<input type="hidden" name="groupid" value="#application.objtextconversion.setformvalue('groupid')#">
		<table id="webPageEditorTable">
			<tr>
				<td class="mainWebPageInfo">
					<fieldset>
						<label class="name"> Parent Group
							<select name="parentusergroupid">
								<cfset p=application.objtextconversion.setformvalue('parentusergroupid')>
								<option value="0">None</option>
								<cfloop query="GroupInfo">
									<cfset r=compare(p,groupid)>
									<option value="#groupid#" <cfif r EQ 0>SELECTED</cfif>><cfloop from="1" to="#nestLevel#" index="i"> &nbsp; &nbsp; </cfloop>#name#</option>
								</cfloop>
							</select>
						</label>
						<label class="name">Name
							<input type="text" name="usergroupname" value="#application.objtextconversion.setformvalue('usergroupname')#">
						</label>
						<cfset thisStatus=application.objtextconversion.setformvalue('status')>
						<label class="name">Status
							<select name="status">
								<option <cfif thisStatus EQ 'Public'>SELECTED</cfif>>Public</option>
								<option <cfif thisStatus EQ 'Private'>SELECTED</cfif>>Private</option>
							</select>
						</label>
						<label class="name">Description
							<textarea name="usergroupdescription">#application.objtextconversion.setformvalue('usergroupdescription')#</textarea>
						</label>
						<label class="name">Keywords
							<textarea name="keywords">#application.objtextconversion.setformvalue('keywords')#</textarea>
						</label>
						<div class="clear"></div>
						<input type="submit" name="submit" value="Submit">
					</fieldset>
				</td>
			</tr>
		</table>
	</form>
</cfoutput>