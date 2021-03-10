<!--- 
Edit permission
	1. Only site administrator or above can edit permission.
	2. Owners and resellers can be set by qd admin.
--->

<cfparam name="url.userid" default="0">
<cfif client.roleid EQ 7>
	<cfset maxroleid=6>
<cfelse>
	<cfset maxroleid=4>
</cfif>
<cfinvoke component="#application.objqdsecurity#" method="getUsersRole" nameid="#url.userid#" returnvariable="sitesWithpermission">
<cfinvoke component="#application.objqdsecurity#" method="getSecurityRoles" maxroleid="#maxroleid#" returnvariable="securityroles">
<cfoutput>
	<h1>Edit Permission</h1>
	<div class="clear"></div>
	<form method="post" action="#formaction#" name="permission">
		<input type="hidden" name="nameid" value="#url.userid#">
		<table class="datagrid" id="managePagesTable">
			<tr class="titlebar">
				<th width="100">Site</th>
				<th width="180">Role</th>
				<th>Modules</th>
			</tr>
			<cfloop query="sitesWithpermission">
				<cfif listfindnocase(Session.adminsites,siteid)>
					<cfset myroleid=roleid>
					<cfset mysiteid=siteid>
					<tr style="height:50px">
						<td>#sitename#</td>
						<td>
							<select name="site#mysiteid#roleid" onclick="enabledisable(#mysiteid#,this.value,#url.userid#)">
								<cfloop query="securityroles">
									<cfset thisroleid=securityroles.roleid>
									<option value="#thisroleid#" <cfif thisroleid EQ myroleid>Selected</cfif>>#securityrole#</option>
								</cfloop>
							</select>
						</td>
						<td id="#siteid#">
							<cfif myroleid EQ 3>
								<cfinvoke component="#application.objqdsecurity#" method="getmodulesinsite" siteid="#mysiteid#" returnvariable="modulesinsite">
								<cfinvoke component="#application.objqdsecurity#" method="getModulesForUser" nameid="#url.userid#" siteid="#mysiteid#" returnvariable="modulesforuser">
								<cfloop query="modulesinsite">
									<cfset checked=FALSE>
									<cfif listfindnocase(modulesforuser,moduleid) GT 0>
										<cfset checked=TRUE>
									</cfif>
									<input type="checkbox" name="site#mysiteid#_module#moduleid#" value="#moduleid#" <cfif checked>Checked</cfif>>#caption#
								</cfloop>
							<cfelse>
								NOT APPLICABLE
							</cfif>
						</td>
					</tr>
				</cfif>
			</cfloop>
		</table>
		<input name="submit" type="submit" value="Update Permission">
	</form>
</cfoutput>