<cfoutput>
	<cfinvoke component="#application.objnewsletter#" method="getAllEmailServers" ds="#client.siteurl#" returnvariable="emailservers">
	<cfif emailservers.recordcount GT 0>
		<h1 style="float:left">Email Servers</h1>
		<span class="right"><a href="/cms/administration/emailserver/addemailserver">+ Add Email Server</span>
		<table class="datagrid" id="managePagesTable">
			<tr class="titlebar">
				<th>Server</th>
				<th>Port</th>
				<th>Username</th>
				<th>Password</th>
				<th>Status</th>
				<th>Token</th>
			</tr>
			<cfloop query="emailservers">
				<cfif currentRow MOD 2 EQ 0>
					<tr class="alt">
				<cfelse>
					<tr>
				</cfif>
				<td>
					<a href="/cms/#url.section#/#url.module#/editemailserver/?s=#serverid#" class="name">#servername#</a>			
				</td>
				<td>#port#</td>
		  		<td>#username#</td>
				<td>#password#</td>
				<td><cfif status EQ 1>Active<cfelse>Inactive</cfif></td>
				<td>
					<cfif status EQ 1 AND token EQ 1>
						Has Token
					<cfelseif status EQ 1 AND token EQ 0>
						<a href="/cms/#url.section#/#url.module#/assigntoken/?s=#serverid#">Assign Token</a>
					</cfif>
				</td>
				</tr>
			</cfloop>
		</table>
	<cfelse>
		<div class="quicknote">
			<h1>There are no email servers added to the system. <a href="/cms/marketing/newsletter/addemailserver">Click here</a> to add a new email server</h1>
		</div>
	</cfif>
</cfoutput>