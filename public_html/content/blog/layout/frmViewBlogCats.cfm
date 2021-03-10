<cfinvoke component="#application.objBlog#" method="getBlogCategories" ds="#client.siteurl#" returnVariable="getBlogCategories">
<cfif NOT getBlogCategories.recordCount>
	<div class="quicknote">
		<h1>There are currently no Categories for this site. 
		<a href="/cms/content/blog/addblogCategory">Click here</a> to add your first Category!</h1>
		<p>It is really easy, plus every site needs at least one Blog Category!</p>
	</div>	
<cfelse>
	<h1 style="float: left;">Blog Categories</h1>
	<span style="float: left; margin: 10px 0 0 10px">
		<!--- Uncomment if you ever want to add the copy function to this page, it has been tested and is working. 
		<a href="" id="copyCategory" title="Copy checked Categories">Copy</a> --->
		<a href="" id="deleteblogCategory" title="Delete checked Categories">Delete</a>
	</span>
	<span style="float: right; margin: 10px 10px 0 10px">
		<a href="/cms/content/blog/addBlogCategory" id="add category" title="Add new category">+ Add Blog Category</a>
	</span>
	<div class="clear"> </div>

	<table class="datagrid" id="managePagesTable">
		<tr class="titlebar">
			<th class="checkbox"><input id="selectAll" type="checkbox" /></th>
			<th>Blog Category</th>
			<th></th>
	 		<th><!--- Author ---></th>
			<th><!--- Status ---></th>
			<th><!--- Date ---></th>
			<th> </th> 
		</tr>
		<cfoutput query="getBlogCategories">
		<cfif currentRow MOD 2 EQ 0>
			<cfif blogcategorystatus EQ 'Deactive'>
				<tr class="alt-deleted">
			<cfelse>
				<tr class="alt">
			</cfif>
		<cfelse>
			<cfif blogcategorystatus EQ 'Deactive'>
				<tr class="deleted">
			<cfelse>
				<tr>
			</cfif>
		</cfif>
			<td><input type="checkbox" id="blog#blogCategoryId#" /></td>
			<td><a href="/cms/content/blog/editBlogCategory/?bc=#blogCategoryId#" class="name" title="Edit &quot;#name#&quot;"> 
			<cfloop from="1" to="#getBlogCategories.recordcount#" index="i"> </cfloop>
			#name#
			</a></td>
			<td><a href="/cms/content/blog/viewBlogEntries/?bc=#blogcategoryid#">(#ENTRYCOUNT# entries)</a></td>
			<td><!--- #firstname# #lastname# ---></td>
			<td><!--- <a href="">#blogcategorystatus#</a> ---></td>
			<td><!--- #convertDate(createdon, "mm/dd/yyyy")# ---></td>
			<td>
				<cfif blogcategorystatus EQ 'Deactive'>
					<a href="/cms/content/blog/restoreblogCategory/?bc=#blogCategoryId#">Restore</a>
				</cfif>
			</td>
		</tr>
		</cfoutput>
	</table>

</cfif>