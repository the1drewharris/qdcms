<cfif NOT thereAreErrors>
	<cfinvoke component="#application.objBlog#" method="getBlogEntries" blogEntryId="#url.blogEntryId#" authorid="#entryauthorid#" ds="#client.siteurl#" returnVariable="myblogEntry">
	<cfif myblogEntry.recordcount EQ 0>
		<cfset client.message="Blog entry not found. If it is 'Deactive', please restore it first">
		<cflocation url="/cms/content/blog/viewBlogEntries" addtoken="false">
	</cfif>
	<cfinvoke component="#application.objBlog#" method="getBlogs" blogEntryId="#url.blogEntryId#" ds="#client.siteurl#" returnVariable="myBlogs">
	<cfloop query="myBlogs">
		<cfset Session.formValues['blog#blogid#']=blogid>
	</cfloop>
	<cfinvoke component="#application.objBlog#" method="getBlogCategories" blogEntryId="#url.blogEntryId#" ds="#client.siteurl#" returnVariable="myCategories">
	<cfloop query="myCategories">
		<cfset Session.formValues['blogcategory#blogcategoryid#']=blogcategoryid>
	</cfloop>
	<cfset Session.formValues['name']=myBlogEntry.name>
	<cfset Session.formValues['entry']=myBlogEntry.entry>
	<cfset Session.formValues['title']=myBlogEntry.title>
	<cfset Session.formValues['keywords']=myBlogEntry.keywords>
	<cfset Session.formValues['description']=myBlogEntry.description>
	<cfset Session.formValues['entrystatus']=myBlogEntry.entrystatus>
	<cfset Session.formValues['publishdate']=application.objtimedateconversion.convertdate(myblogEntry.postdate,'mm/dd/yyyy')>
	<cfset Session.formValues['publishhour']=Mid(myblogEntry.postdate,9,2)>
	<cfset Session.formValues['publishmin']=Mid(myblogEntry.postdate,11,2)>
	<cfset Session.formValues['authorid']=myblogEntry.authorid>
	<cfif Session.formValues['publishhour'] GTE 12>
		<cfset Session.formValues['publishampm']="PM">
		<cfif Session.formValues['publishhour'] GT 12>
			<cfset Session.formValues['publishhour']=Session.formValues['publishhour']-12>
		</cfif>
	<cfelse>
		<cfset Session.formValues['publishampm']="AM">
	</cfif>
</cfif>