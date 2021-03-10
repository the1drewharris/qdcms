<cftransaction>
	<cfloop list="#url.blogcategoryList#" index="id">
		<cfinvoke component="#application.objBlog#" method="updateBlogCategory" ds="#client.siteurl#" blogcategoryid="#id#" blogcategorystatus="Deactive" authorid="#client.masternameid#">
	</cfloop>
</cftransaction>
<cfinclude template="/actions/tracking.cfm">
<cflocation url="/cms/content/blog/viewBlogCategories" addToken="no">