<cfoutput>
	<cfinvoke component="#application.objproduct#" method="getProductsandGroups" productdsn="#client.siteurl#" returnvariable="products">
	<cfif products.recordcount GT 0>
		<h1 style="float:left">Products</h1>
		<span class="right">
			<a href="/cms/#url.section#/#url.module#/addproduct">+ Add Product</a>
		</span>
		<table class="datagrid" id="managePagesTable">
			<tr class="titlebar">
				<th>Name</th>
				<th>Product</th>
				<th>Subscriable</th>
				<th>On Sale</th>
			</tr>
			<cfloop query="products">
				<cfif currentRow MOD 2 EQ 0>
					<tr class="alt">
				<cfelse>
					<tr>
				</cfif>
				<td>
					<cfif idfor EQ 'product'>
						<a href="/cms/#url.section#/#url.module#/editproduct/?id=#id#" class="name">#itemname#</a>			
					<cfelse>
						<a href="/cms/#url.section#/#url.module#/editproductgroup/?id=#id#" class="name">#itemname#</a>
					</cfif>
				</td>
				<td>#idfor#</td>
		  		<td><cfif subscriable EQ 1>Yes<cfelse>No</cfif></td>
				<td><cfif stopselling EQ 0>Yes<cfelse>No</cfif></td>
				</tr>
			</cfloop>
		</table>
	<cfelse>
		<div class="quicknote">
			There are currenty no Products registered. <a href="/cms/#url.section#/#url.module#/addproduct">Click here</a> to add Products.
		</div>
	</cfif>
</cfoutput>