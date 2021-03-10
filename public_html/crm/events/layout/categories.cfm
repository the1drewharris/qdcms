<cfoutput>
	<cfinvoke component="#application.objevent#" method="getCategories" status="ALL" eventdsn="#client.siteurl#" returnVariable="categories">
	<cfif NOT categories.recordCount>
		<div class="quicknote">
			<h1>There are currently no Event Categories for this site. 
			<a href="/cms/crm/events/addcategory">Click here</a> to add your first Category!</h1>
			<p>It is really easy</p>
		</div>	
	<cfelse>
		<h1 style="float: left;">Event Categories</h1>
		<span style="float: left; margin: 10px 0 0 10px">
			<a href="" id="deleteCategory" title="Delete checked Categories">Delete</a>
		</span>
		<span style="float: right; margin: 10px 10px 0 10px">
			<a href="/cms/crm/events/addeventcategory" id="add category" title="Add new category">+ Add Event Category</a>
		</span>
		<div class="clear"> </div>
	
		<table class="datagrid" id="managePagesTable">
			<tr class="titlebar">
				<th class="checkbox"><input id="selectAll" type="checkbox" /></th>
				<th>Category</th>
				<th>Description</th>
		 		<th>Status</th>
			</tr>
			<cfloop query="categories">
			<cfif currentRow MOD 2 EQ 0><cfif status NEQ 'Public'><tr class="alt-deleted"><cfelse><tr class="alt"></cfif>
			<cfelse><cfif status NEQ 'Public'><tr class="deleted"><cfelse><tr></cfif></cfif>
				<td><input type="checkbox" id="category#eventCategoryId#" /></td>
				<td><a href="/cms/crm/events/editeventcategory/?eventcategoryid=#eventcategoryid#">#eventcategory#</a></td>
				<td>#Mid(description,1,100)#</td>
				<td>#status#</td>
			</tr>
			</cfloop>
		</table>
	</cfif>
</cfoutput>