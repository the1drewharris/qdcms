<cfparam name="url.b" default="0">
<cfparam name="url.bc" default="0">
<cfparam name="url.s" default="0">
<cfparam name="url.d" default="0">
<cfparam name="url.c" default="0">
<cfset prefixurl="/cms/content/blog/viewBlogEntries/?q=s">

<cfif url.s LT 0>
	<cfset url.s=0>
</cfif>
<cfset args=structNew()>
<cfset args.ds=client.siteurl>
<cfset args.blogid=url.b>
<cfset args.blogcategoryid=url.bc>
<cfset args.noofentries=20>
<cfset args.authorid=entryauthorid>
<cfif isDefined('form.dateposted')>
	<cfif form.dateposted neq "">
		<cfset dateposted=Application.objtimedateconversion.datetoint(form.dateposted)>
		<cfset args.daterange=left(dateposted,8)>
		<cfset prefixurl="#prefixurl#&d=#args.daterange#">
	</cfif>
<cfelseif url.d NEQ 0>
	<cfset args.daterange=left(url.d,8)>	
	<cfset prefixurl="#prefixurl#&d=#args.daterange#">
</cfif>

<cfif isDefined('form.criteria') AND Trim(form.criteria) NEQ "">
	<cfset args.criteria=Trim(form.criteria)>
	<cfset prefixurl="#prefixurl#&c=#args.criteria#">
<cfelseif url.c NEQ 0>
	<cfset args.criteria=url.c>
	<cfset prefixurl="#prefixurl#&c=#args.criteria#">
</cfif>

<cfif isDefined('form.blogid') AND form.blogid NEQ 0>
	<cfset args.blogid=form.blogid>
	<cfset prefixurl="#prefixurl#&b=#args.blogid#">
<cfelseif url.b NEQ 0>
	<cfset args.blogid=url.b>
	<cfset prefixurl="#prefixurl#&b=#args.blogid#">
</cfif>

<cfif url.bc NEQ 0>
	<cfset args.blogcategoryid=url.bc>
	<cfset prefixurl="#prefixurl#&bc=#url.bc#">
</cfif>

<cfset args.startrow=url.s+1>
<cfif url.s EQ 0>
	<cfinvoke component="#application.objBlog#" method="getBlogEntryCount" argumentcollection="#args#" returnvariable="client.blogentrycount">
<cfelseif url.s GT client.blogentrycount>
	<cfset args.startrow=client.blogentrycount-args.noofentries+1>
</cfif>
<cfset prefixurl="#prefixurl#&s=">

<cfinvoke component="#application.objpagination#" method="get" perpage="#args.noofentries#" currentValue="#args.startrow#" totalrows="#client.blogentrycount#" prefixURL="#prefixurl#" returnvariable="pagination">
<cfinvoke component="#application.objBlog#" method="getBlogEntryHeaders" argumentcollection="#args#" returnVariable="getBlogEntries">
<cfinvoke component="#application.objBlog#" method="getBlogs" ds="#client.siteurl#" status="published" returnVariable="Blogs">

<cfif NOT getBlogEntries.recordCount>
	<div class="quicknote">
		<h1>There are currently no Blog Entries. 
		<a href="/index.cfm?section=content&module=blog&action=addblogEntry">Click here</a> to add a Blog Entry!</h1>
		<p>It is really easy, plus every site needs at least one Blog Entry!</p>
		<p>OR..</p>
		<h1><a href="/index.cfm?section=content&module=blog&action=convertBlog">Click here</a> to see if we can migrate old blog entries for you!</h1>
	</div>	
<cfelse>
	<h1 style="float: left;">Blog Entries</h1>
	<span class="left">
		<a href="" id="copyblogEntry" title="Copy checked Entries">Copy</a>
		<a href="" id="deleteblogEntry" title="Delete checked Entries">Delete</a>
	</span>
	<span class="right">
		<a href="/cms/content/blog/addBlogEntry" id="addEntry" title="Add new entry">+ Add Blog Entry</a>
	</span>
	
	<div class="clear"> </div>

	<table width="910">
		<tr>
			<td>&nbsp;</td>
			<form id="form" method="post" action="/cms/content/blog/viewBlogEntries">
			<td width="130">
				<select name="blogid">
					<option value="0">All Blogs</option>
					<cfoutput query="blogs">
						<option value="#blogid#">#name#</option>
					</cfoutput>
				</select>
			</td>
			<td width="240" style="font-weight:bold;">
				Date Posted <input id="dateposted" name="dateposted" rel="actual" type="text" />
			</td>
			<td width="210" style="font-weight:bold;">Search <input type="text" name="criteria" /></td>
			<td><input type="submit" value="Search" /></td>
			</form>
		</tr>
	</table>

	<table class="datagrid" id="managePagesTable">
		<tr class="titlebar">
			<th class="checkbox"><input id="selectAll" type="checkbox" /></th>
			<th>Blog Entry</th>
			<th>Author</th>
			<th>Last Updated By</th>
			<th>Status</th>
			<th>Created On</th>
			<th></th>
		</tr>
		<cfoutput query="getBlogEntries">
			<cfinvoke component="#application.abCFC#" method="searchContacts" contactdsn="#application.masterdsn#" userid="#authorid#" returnvariable="entryAuthor">
			<cfif currentRow MOD 2 EQ 0>
				<cfif entryStatus EQ 'Deactive'>
					<tr class="alt-deleted">
				<cfelse>
					<tr class="alt">
				</cfif>
			<cfelse>
				<cfif entryStatus EQ 'Deactive'>
					<tr class="deleted">
				<cfelse>
					<tr>
				</cfif>
			</cfif>
			<td><input type="checkbox" id="blog#blogEntryId#" /></td>
			<td>
				<cfif entrystatus NEQ "Deactive">
					<a href="/cms/content/blog/editBlogEntry/?blogEntryId=#blogEntryId#"> 
						<cfif Trim(name) NEQ "">#name#<cfelse><i>No Name</i></cfif>
					</a>
				<cfelse>
					<cfif Trim(name) NEQ "">#name#<cfelse><i>No Name</i></cfif>
				</cfif>
			</td>
			<td>#entryAuthor.firstname# #entryAuthor.lastname#</td>
			<td>#lastupdatedby#</td>
			<td>#EntryStatus#</td>
			<td>#application.objtimedateconversion.convertDate(CREATEDON, "mm/dd/yyyy")#</td>
			<td>
				<cfif entryStatus EQ 'Deactive'>
					<a href="/cms/content/blog/restoreblogentry/?blogEntryId=#blogEntryId#">Restore</a>
				</cfif>
			</td>
		</tr>
		</cfoutput>
	</table>
	
	<table width="910">
		<tr>
			<td colspan="5" align="right"><cfoutput>#pagination#</cfoutput></td>
		</tr>
	</table>

</cfif>