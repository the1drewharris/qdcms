<cfinvoke component="#application.objsite#" method="getSiteUrlAndId" returnvariable="siteList">
<cfoutput>
	<h1>#action#</h1>
	<table class="datagrid" id="managePagesTable">
		<tr class="titlebar">
			<th>Site Name</th>
			<th>URL</th>
			<th>Status</th>
			<th>System</th>
			<th></th>
		</tr>
		<cfloop query="sitelist">
			<cfif currentRow MOD 2 EQ 0><tr class="alt"><cfelse><tr></cfif>
				<td><a href="/cms/#url.section#/#url.module#/editsite/?s=#siteid#">#sitename#</a></td>
				<td>#siteurl#</td>
				<td>#status#</td>
				<td><cfif system EQ 1>Old Legacy<cfelseif system EQ 3>QDCMS<cfelse>Legacy</cfif></td>
				<td><cfif system NEQ 3><a href="/cms/administration/site/convertsite/?siteid=#siteid#">Convert</cfif></td>
			</tr>
		</cfloop>
	</table>
</cfoutput>