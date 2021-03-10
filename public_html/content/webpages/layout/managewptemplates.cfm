<cfoutput>
	<cfinvoke component="#application.objwebpage#" method="getTemplate" webdsn="#client.siteurl#" returnVariable="getTemplates">
	<cfif getTemplates.recordCount GT 0>
		<h1 style="float: left;">Web Pages</h1>
		<span style="float: left; margin: 10px 0 0 10px">
			<a href="" id="copyWPTemplate" title="Copy checked Web Pages">Copy</a>
			<a href="" id="deleteWPTemplate" title="Delete checked Web Pages">Delete</a>
		</span>
		<div class="clear"> </div>
		
		<table class="datagrid" id="managePagesTable">
			<tr class="titlebar">
				<th class="checkbox"><input id="selectAll" type="checkbox" /></th>
				<th>Title</th>
				<th>Description</th>
				<th>Status</th>
				<th> </th>
			</tr>
			<cfloop query="getTemplates">
				<cfif currentRow MOD 2 EQ 0>
					<cfif status EQ 'Deactive'>
						<tr class="alt-deleted">
					<cfelse>
						<tr class="alt">
					</cfif>
				<cfelse>
					<cfif status EQ 'Deactive'>
						<tr class="deleted">
					<cfelse>
						<tr>
					</cfif>
				</cfif>
					<td><input type="checkbox" id="wp#wptemplateid#" /></td>
					<td><a href="/cms/content/webpages/editwptemplate/?templateid=#wptemplateid#" class="name" title="Edit &quot;#name#&quot;"> 
					#name#
					</a></td>
					<td>#description#</td>
					<td><a href="">#status#</a></td>
					<td><cfif status EQ 'Deactive'><a href="/cms/content/webpages/restorewptemplate/?templateid=#wptemplateid#">Restore</a></cfif></td>
				</tr>
			</cfloop>
		</table>
	</cfif>
</cfoutput>