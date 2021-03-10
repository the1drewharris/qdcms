<cfloop list="#url.blogList#" index="id">
	<cfinvoke component="#application.objBlog#" method="updateBlog" ds="#client.siteurl#" blogid="#id#" status="Deactive" authorid="#client.masternameid#">
</cfloop>
<cfinclude template="/actions/tracking.cfm">
<cflocation url="/cms/content/blog/viewBlogs" addToken="false">