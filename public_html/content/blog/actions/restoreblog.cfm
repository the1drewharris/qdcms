<cfparam name="url.b" default="0">
<cftransaction>
	<cfinvoke component="#application.objBlog#" method="updateBlog" ds="#client.siteurl#" blogid="#url.b#" status="Active" authorid="#client.masternameid#">
</cftransaction>
<cfinclude template="/actions/tracking.cfm">
<cflocation url="/cms/content/blog/viewBlogs" addToken="false">