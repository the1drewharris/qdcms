<cfoutput>
	<h1>#title#</h1>
	<form action="/cms/administration/patches/#formaction#" id="form" method="post">
		<cfif url.action EQ "editpatch">
			<input type="hidden" name="patchid" value="#application.objtextconversion.setFormValue('patchid')#">
		</cfif>
		<table id="webPageEditorTable"  class="htmform" cellpadding="3" >
		  	<tr>
				<td class="mainWebPageInfo">
					<fieldset>
						<label class="name">
							Patch Name
				    		<input type="text" name="patchname" value="#application.objtextconversion.setformValue('patchname')#" />
						</label>
						<label class="name">
							File Name
				    		<input type="text" name="filename" value="#application.objtextconversion.setformValue('filename')#" />
						</label>
						<label class="name">
							<cfset thisstatus=application.objtextconversion.setformValue('status')>
							Status
							<select name="status">
								<option value="1">Active</option>
								<option value="0" <cfif thisstatus EQ 0>SELECTED</cfif>>Inactive</option>
							</select>
						</label>
						<label class="name">
							Description
				    		<textarea name="description">#application.objtextconversion.setformValue('description')#</textarea>
						</label>
					</fieldset>
				</td>
				<cfif url.action EQ "editpatch">
					<td class="quickWebPageInfo">
						<div class="container">
							<div class="header">This patch has been applied to #sitesThePatchHasBeenAppliedTo.recordcount# Websites</div> <br />
							<cfif sitesThePatchHasBeenAppliedTo.recordcount GT 0>
								<cfloop query="sitesThePatchHasBeenAppliedTo">
									#siteurl#<br />
								</cfloop>
							</cfif>
						</div>
					</td>
				</cfif>
		 	</tr>
		 	<tr>
		   		<td colspan="2" align="left">
					<input type="submit" name="Submit" value="Submit" >
				</td>
		 	</tr>
		</table>
	</form>
</cfoutput>