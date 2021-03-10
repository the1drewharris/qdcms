<cftransaction>
	<cfloop list="#url.blogentryList#" index="id">
		<cfinvoke component="#application.objBlog#" method="updateBlogEntryStatus" ds="#client.siteurl#" blogEntryId="#id#" entryStatus="Deleted" authorid="#client.masternameid#">
	</cfloop>
</cftransaction>
<cfinvoke component="#application.objBlog#" method="createRSS" domain="#client.siteurl#">
<cfinvoke component="#application.objBlog#" method="createRSSforBlogs" domain="#client.siteurl#">
<cfinclude template="/actions/tracking.cfm">
<cflocation url="/cms/content/blog/viewBlogEntries" addToken="false"> 