<cfinclude template="validateentry.cfm">
<cfif formHasNoErrors>
	<cfset form.ds=client.siteurl>
	<cfinvoke component="#application.objtimedateconversion#" method="datetoint" date="#form.publishdate#" hours="#form.publishhour#" minutes="#form.publishmin#" ampm="#form.publishampm#" returnvariable="form.postdate">
	
	<cftransaction>
		<cfinvoke component="#application.objBlog#" method="updateBlogEntry" argumentcollection="#form#" lastupdatedby="#client.firstname# #client.lastname#">
		
		<cfif form.postdate GT application.objtimedateconversion.createtimedate() and form.entrystatus EQ "published">
			<cfset publishtime=application.objtimedateconversion.converttime(form.postdate,"hh:mmtt")>
			<cfschedule action="update" URL="http://#CGI.SERVER_NAME#/content/blog/actions/publish.cfm?domain=#client.siteurl#" operation="HTTPRequest"
						startdate="#form.publishdate#" starttime="#publishtime#" interval="once" task="publish_blog_#form.blogEntryId#">
		<cfelseif form.entrystatus NEQ "published">
			<cfschedule action="delete" task="publish_blog_#form.blogEntryId#">
		</cfif>
		
		<cfinvoke component="#application.objBlog#" method="removeBlogEntryfromBlog" ds='#client.siteurl#' blogentryid="#form.blogEntryId#">
		<cfinvoke component="#application.objBlog#" method="removeBlogEntryfromBlogCategory" ds='#client.siteurl#' blogentryid="#form.blogEntryId#">
	
		<cfloop list="#mybloglist#" index="blogid">
			<cfinvoke component="#application.objBlog#" method="addBlogEntrytoBlog" ds="#client.siteurl#" blogid="#blogid#" blogentryid="#form.blogEntryId#">
		</cfloop>
		
		<cfloop list="#myblogcategorieslist#" index="blogcategoryid">
			<cfinvoke component="#application.objBlog#" method="addBlogEntrytoBlogCategory" ds="#client.siteurl#" blogcategoryid="#blogcategoryid#" blogentryid="#form.blogEntryId#">
		</cfloop>
		
		<cfif isDefined('form.setme')>
			<cfif form.setme EQ 1>
				<cfset args=StructNew()>
				<cfset args.ds=client.siteurl>
				<cfset args.blogentryid=form.blogentryid>
				<cfset args.newauthorid=client.masternameid>
				<cfinvoke component="#application.objBlog#" method="setAuthor" argumentcollection="#args#">
			</cfif>
		</cfif>
	</cftransaction>
	<!--- Set a message to let user know they have saved the Entry successfully --->
	<cfset client.message="The Blog Entry, #form.name# has been saved successfully.">
	<cfinclude template="/actions/tracking.cfm">
	<cflocation url="/cms/content/blog" addtoken="false">
<cfelse>
	<cflocation url="/cms/content/blog/editBlogEntry" addtoken="false">
</cfif>