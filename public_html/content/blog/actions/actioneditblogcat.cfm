<cfinclude template="validateblogandcat.cfm">
<cfif formHasNoErrors>
	<cftransaction>
		<cfinvoke component="#application.objBlog#" method="updateBlogCategory" ds="#client.siteurl#" argumentcollection="#form#" authorid="#client.masternameid#">
	</cftransaction>
	<cfset client.message='The Category, #form.name# has been updated successfully'>
	<cfinclude template="/actions/tracking.cfm">
	<cflocation url="/cms/content/blog/viewblogCategories" addtoken="false">
<cfelse>
	<cflocation url="/cms/content/blog/editBlogCategory/?bc=#form.blogcategoryid#" addtoken="false">
</cfif>