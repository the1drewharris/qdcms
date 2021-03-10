<cfinclude template="validateblogandcat.cfm">
<cfif formHasNoErrors>
	<cftransaction>
		<cfinvoke component="#application.objBlog#" method="updateBlog" ds="#client.siteurl#" argumentcollection="#form#" authorid="#client.masternameid#">
	</cftransaction>
	<cfset client.message='The Blog, #form.name# has been updated successfully'>
	<cfinclude template="/actions/tracking.cfm">
	<cflocation url="/cms/content/blog/viewBlogs">
<cfelse>
	<cflocation url="/cms/content/blog/editBlog/b=#form.blogid#">
</cfif>