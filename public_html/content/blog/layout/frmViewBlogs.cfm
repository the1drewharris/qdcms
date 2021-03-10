<cfinvoke component="#application.objBlog#" method="getBlogs" ds="#client.siteurl#" returnVariable="getBlogs">
<cfif NOT getBlogs.recordCount>
	<div class="quicknote">
		<h1>There are currently no blogs for this site. 
		<a href="/index.cfm?section=content&module=blog&action=addBlog">Click here</a> to add your first blog!</h1>
		<p>It is really easy, plus every site needs at least one blog!</p>
	</div>	
<cfelse>
	<h1 style="float: left;">Blogs</h1>
	<span style="float: left; margin: 10px 0 0 10px">
		<a href="" id="deleteblog" title="Delete checked Blogs">Delete</a>
	</span>
	<span style="float: right; margin: 10px 10px 0 10px">
		<a href="/cms/content/blog/addBlog" id="addblog" title="Add new blog">+ Add Blog</a>
	</span>
	<div class="clear"> </div>

	<table class="datagrid" id="managePagesTable">
		<tr class="titlebar">
			<th class="checkbox"><input id="selectAll" type="checkbox" /></th>
			<th>Name</th>
			<th>No of Entries</th>
			<th>Status</th> 
		</tr>
		<cfoutput query="getBlogs">
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
				<td><input type="checkbox" id="blog#blogid#" /></td>
				<td><a href="/cms/content/blog/editBlog/?b=#blogid#" class="name" title="Edit &quot;#name#&quot;"> 
				<cfif Trim(name) NEQ "">#name#<cfelse>No Name</cfif>
				</a></td>
				<td><a href="/cms/content/blog/viewBlogEntries?b=#blogid#">(#ENTRYCOUNT# entries)</a></td>
				<td>
					<cfif status EQ 'Deactive'>
						Deleted<a href="/cms/content/blog/restoreblog/?b=#blogId#">(Restore)</a>
					<cfelse>
						Active
					</cfif>
				</td>
			</tr>
		</cfoutput>
	</table>
</cfif>