<cfoutput>
	<h1>#title#</h1>
	<form action="/cms/#url.section#/#url.module#/#formaction#" id="form" method="post">
		<input type="hidden" name="serverid" value="#application.objtextconversion.setFormValue('serverid')#">
		<table id="webPageEditorTable"  class="htmform" cellpadding="3" >
		  	<tr>
				<td class="mainWebPageInfo">
					<fieldset>
						<label class="name">Server Name
				    		<input type="text" name="servername" value="#application.objtextconversion.setformValue('servername')#" />
						</label>
						<label class="name">Port
				    		<input type="text" name="port" value="#application.objtextconversion.setformValue('port')#" />
						</label>
						<label class="name">Username
				    		<input type="text" name="username" value="#application.objtextconversion.setformValue('username')#" />
						</label>
						<label class="name">Password
				    		<input type="text" name="password" value="#application.objtextconversion.setformValue('password')#" />
						</label>
						<cfset emailServerStatus=application.objtextconversion.setFormValue('status')>
						<label class="name">Status
							<select name="status">
								<option value="1" <cfif emailServerStatus EQ 1>Selected</cfif>>Active</option>
								<option value="0" <cfif emailServerStatus EQ 0>Selected</cfif>>Inactive</option>
							</select>
						</label>
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