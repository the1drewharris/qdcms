<cfobject component="formvalidation" name="objformvalidation">
<cfset objformvalidation.set_rules('name','Entry name','required,max_len[120]')>
<cfset objformvalidation.set_rules('entry','Entry','required')>
<cfset myblogcategorieslist="">
<cfset mybloglist="">
<cfinvoke component="#application.objBlog#" method="getBlogCategories" ds="#client.siteurl#" returnVariable="myCategory">
<cfinvoke component="#application.objBlog#" method="getBlogs" ds="#client.siteurl#" status="published"returnVariable="myBlogs">
<cfloop query="mycategory">
	<cfif isDefined('form.blogcategory#blogcategoryid#')>
		<cfset myblogcategorieslist=listAppend(myblogcategorieslist,blogcategoryid)>
	</cfif>
</cfloop>
<cfloop query="myblogs">
	<cfif isDefined('form.blog#blogid#')>
		<cfset mybloglist=listAppend(mybloglist,blogid)>
	</cfif>
</cfloop>

<cfif form.entrystatus EQ "published">
	<cfif listlen(myblogcategorieslist) EQ 0>
		<cfset objformvalidation.addError('You have to select at least one category to publish this blog entry')>
	</cfif>
	<cfif listlen(mybloglist) EQ 0>
		<cfset objformvalidation.addError('You have to select at least one blog to publish this blog entry')>
	</cfif>
	<cfset objformvalidation.set_rules('publishdate','Publish on','required,date')>
</cfif>

<cfif objformvalidation.isValidform()>
	<cfset formHasNoErrors=TRUE>
<cfelse>
	<cfset formHasNoErrors=FALSE>
	<cfset client.message="Please correct the following errors">
	<cfset client.errorList=objformvalidation.getListofErrors()>
	<cfloop list="#form.fieldnames#" index="fieldname">
		<cfset session.formValues['#fieldname#']=form['#fieldname#']>
	</cfloop>
</cfif>