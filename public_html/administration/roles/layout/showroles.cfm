<cfinclude template="/display/errors.cfm">
<h1 style="float: left;">Roles</h1>
<div class="clear"></div>
<table class="datagrid" id="managePagesTable">
	<tr class="titlebar">
		<th class="checkbox"></th>
		<th>Role</th>
		<th>Description</th>
	</tr>
	<cfinvoke component="#application.objqdsecurity#" method="getSecurityRoles" returnvariable="securityRoles">
	<cfoutput query="securityRoles">
		<tr>
			<td></td>
			<td>
				<a href="/cms/administration/roles/editrole/?roleid=#roleid#" class="name" title="Edit &quot;#securityrole#&quot;"> 
					<cfif Trim(securityrole) NEQ "">#securityrole#<cfelse><i>No Name</i></cfif>
				</a>
			</td>
			<td>#description#</td>
		</tr>
	</cfoutput>
</table>