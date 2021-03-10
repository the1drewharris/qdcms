<cftransaction>
	<cfinvoke component="#application.objBlog#" method="updateBlogCategoryStatus" ds="#client.siteurl#" blogcategoryid="#url.bc#" blogcategorystatus="Published">
</cftransaction>
<cfinclude template="/actions/tracking.cfm">
<cflocation url="/cms/content/blog/viewBlogCategories" addToken="false"> 