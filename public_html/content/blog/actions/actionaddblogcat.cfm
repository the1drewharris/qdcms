<cfinclude template="validateblogandcat.cfm">
<cfif formHasNoErrors>
	<cftransaction>
		<cfinvoke component="#application.objBlog#" method="addBlogCategory" ds="#client.siteurl#" argumentcollection="#form#" authorid="#client.masternameid#">
	</cftransaction>
	<cfset client.message='The Blog Category,#form.name# has been saved successfully'>
	<cfinclude template="/actions/tracking.cfm">
	<cflocation url="/cms/content/blog/viewBlogCategories" addtoken="false">
<cfelse>
	<cflocation url="/cms/content/blog/addBlogCategory" addtoken="false">
</cfif>