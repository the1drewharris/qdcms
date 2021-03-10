<cfinclude template="validateblogandcat.cfm">
<cfif formHasNoErrors>
	<cftransaction>
		<cfinvoke component="#application.objBlog#" method="addBlog" ds="#client.siteurl#" argumentcollection="#form#" authorid="#client.masternameid#">
	</cftransaction>
	<cfset client.message='The Blog, #form.name# has been saved successfully'>
	<cfinclude template="/actions/tracking.cfm">
	<cflocation url="/cms/content/blog/viewBlogs" addtoken="false">
<cfelse>
	<cflocation url="/cms/content/blog/addBlog" addtoken="false">
</cfif>