<cfinvoke component="#application.objlinks#" method="getLinks" ds="#client.siteurl#" returnvariable="siteLinks">
<cfoutput>
	<cfif siteLinks.recordcount gt 0>
		<h1 style="float:left;">Manage Links</h1>
		<span style="float: left; margin: 10px 0 0 10px">
			<a href="" id="deletelink" title="Delete checked Links">Delete</a>
		</span>
		<table class="datagrid" id="managePagesTable">
			<tr class="titlebar">
				<th class="checkbox"><input id="selectAll" type="checkbox" /></th>
				<th>Name</th>
				<th>Href</th>
				<th>Target</th>
				<th>Title</th>
			</tr>
			<cfloop query="siteLinks">
				<cfif currentRow mod 2 EQ 1><tr class="alt"><cfelse><tr></cfif>
					<td><input type="checkbox" id="link#linkid#" /></td>
					<td><a href="/cms/content/links/editlink/?linkid=#linkid#">#Name#</a></td>
					<td>#href#</td>
					<td>#Target#</td>
					<td>#Title#</td>
				</tr>
			</cfloop>
		</table>
	<cfelse>
		<div class="quicknote">
			<h1>There are no links set up yet for this site</h1>
		</div>
	</cfif>
</cfoutput>