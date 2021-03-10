<cfif NOT thereAreErrors>
	<cfinvoke component="#application.objBlog#" method="getBlogCategories" blogCategoryId="#url.bc#"  ds="#client.siteurl#" returnVariable="myBlog">
	<cfset session.formValues['name']=myBlog.name>
	<cfset session.formValues['title']=myBlog.title>
	<cfset session.formValues['keywords']=myBlog.keywords>
	<cfset session.formValues['description']=myBlog.description>
</cfif>