<cfoutput>
	<cfinvoke component="#Application.abCFC#" method="getGroupInfo" contactdsn="#client.siteurl#" returnVariable="usergroups">
	<cfset grouplist=valuelist(usergroups.groupid)>
	<span class="left">
	<h1>User Groups</h1>
	</span>
	<span class="right">
		<a href="/cms/crm/addressbook/addgroup" title="Add new Group">+ Add Group</a>
	</span>
	<cfset rowstyle="">
	<table class="datagrid" id="managePagesTable">
	<tr class="titlebar">
		<th>Group Name</th>
		<th>No Of Contacts</th>
		<th></th>
	</tr>
		<cfloop query="usergroups">
			<tr class="#rowstyle#">
				<td>
					<a href="/cms/crm/addressbook/editgroup/?groupid=#groupid#" class="name">
						<cfif nestlevel GT 0>
							<cfloop from="1" to="#nestlevel#" index="i">
								&##8212;
							</cfloop>
						</cfif>
						#name#
					</a>
				</td>
				<td>#groupcount#</td>
				<td>
					<cfif groupcount EQ 0>
						<cfinvoke component="#Application.abCFC#" method="checkIfGroupCanBeDeleted" contactdsn="#client.siteurl#" returnvariable="itCanBeDeleted">
						<cfif itCanBeDeleted>
							<a href="/cms/crm/addressbook/actiondeletegroup/?g=#groupid#">Delete</a>
						</cfif>
					</cfif>
				</td>
			</tr>
			<cfif rowstyle EQ "alt">
				<cfset rowstyle="">
			<cfelse>
				<cfset rowstyle="alt">
			</cfif>
		</cfloop>
	</table>
</cfoutput>