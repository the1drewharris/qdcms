<cfparam name="url.h" default="0">
<cfset statuslist="Public,Private,Purchased,Shared,Non-Active">
<cfinvoke component="#application.objhau#" method="getmyelligibleparent" haudsn="#client.siteurl#" aboutusid="#url.h#" returnvariable="elligible">
<cfoutput>
	<h1>#title#</h1>
	<form action="/cms/marketing/heardaboutus/#formaction#" id="form" method="post">
		<input type="hidden" name="aboutusid" value="#application.objtextconversion.setformvalue('aboutusid')#">
		<table id="webPageEditorTable"  class="htmform" cellpadding="3" >
		  	<tr>
				<td class="mainWebPageInfo">
					<fieldset>
						<label class="name">About Us Name
				    		<input type="text" name="aboutus" value="#application.objtextconversion.setformValue('aboutus')#" />
						</label>
						
						<cfset myparent=application.objtextconversion.setformvalue('aboutusparentid')>
						<label class="name">Select Parent
							<select name="aboutusparentid">
								<option value="0">No Parent</option>
								<cfloop query="elligible">
									<option value="#aboutusid#" <cfif myparent EQ aboutusid>SELECTED</cfif>><cfif NESTLEVEL GT 0><cfloop from="1" to="#NESTLEVEL#" index="i"> &mdash;</cfloop></cfif>#aboutus#</option>
								</cfloop>
							</select>
						</label>
						
						<cfset thisstatus=application.objtextconversion.setformvalue('status')>
						<label class="name">Status
							<select name="status">
								<cfloop list="#statuslist#" index="status">
									<option value="#status#" <cfif thisstatus EQ status>SELECTED</cfif>>#status#</option>
								</cfloop>
							</select>
						</label>
					</fieldset>
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