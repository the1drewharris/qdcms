<cfoutput>
	<cfinvoke component="#application.objproduct#" method="getProductGroups" productdsn="#client.siteurl#" returnvariable="productgroups">
	<cfif productgroups.recordcount GT 0>
		<h1 style="float:left">Product Groups</h1>
		<span class="right">
			<a href="/cms/#url.section#/#url.module#/addproductgroup">+ Add Product Group</a>
		</span>
		<table class="datagrid" id="managePagesTable">
			<tr class="titlebar">
				<th>Grouped Product</th>
				<th>Subscriable</th>
				<th>On Sale</th>
				<th></th>
			</tr>
			<cfloop query="productgroups">
				<cfif currentRow MOD 2 EQ 0>
					<tr class="alt">
				<cfelse>
					<tr>
				</cfif>
				<td>
					<a href="/cms/#url.section#/#url.module#/editproductgroup/?id=#id#">#itemname#</a>
					(<a href="/cms/#url.section#/#url.module#/showitems/?id=#id#">Show Items</a>)
				</td>
		  		<td><cfif subscriable EQ 1>Yes<cfelse>No</cfif></td>
				<td><cfif stopselling EQ 0>Yes<cfelse>No</cfif></td>
				<td><a href="/cms/#url.section#/#url.module#/additemtoproductgroup/?id=#id#">Add Items</a></td>
				</tr>
			</cfloop>
		</table>
	<cfelse>
		<div class="quicknote">
			There are currenty no product groups. <a href="/cms/#url.section#/#url.module#/addproductgroups">Click here</a> to add Product Group.
		</div>
	</cfif>
</cfoutput>