<cftransaction>
	<cfinvoke component="#application.objBlog#" method="updateBlogEntryStatus" ds="#client.siteurl#" blogEntryId="#url.blogEntryId#" status="Active" authorid="#client.masternameid#">
	<cfinvoke component="#application.objBlog#" method="createRSS" domain="#client.siteurl#">
	<cfinvoke component="#application.objBlog#" method="createRSSforBlogs" domain="#client.siteurl#">
</cftransaction>
<cfinclude template="/actions/tracking.cfm">
<cflocation url="/cms/content/blog/viewBlogEntries" addToken="false"> 