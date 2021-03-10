<cfoutput>
	<cfinvoke component="#application.objproduct#" method="getcategory" productdsn="#client.siteurl#" returnvariable="categories">
	<cfif categories.recordcount GT 0>
		<h1 style="float:left">Product Categories</h1>
		<span class="right"><a href="/cms/#url.section#/#url.module#/addcategory">+ Add Category</a></span>
		<table class="datagrid" id="managePagesTable">
			<tr class="titlebar">
				<th>Category</th>
				<th></th>
			</tr>
			<cfloop query="categories">
				<cfif currentRow MOD 2 EQ 0>
					<tr class="alt">
				<cfelse>
					<tr>
				</cfif>
				<td>
					<a href="/cms/#url.section#/#url.module#/editcategory/?c=#categoryid#" class="name">
						<cfloop from="2" to="#NESTLEVEL#" index="i">&mdash;</cfloop>
						#category#
					</a>			
				</td>
				<td></td>
				</tr>
			</cfloop>
		</table>
	<cfelse>
		<div class="quicknote">
			No category has been added to the database. <a href="/cms/#url.section#/#url.module#/addcategory">Click here</a> add a new category.
		</div>
	</cfif>
</cfoutput>