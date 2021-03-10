<cfinclude template="validateentry.cfm">
<cfif formHasNoErrors>
	<cfset form.ds=client.siteurl>
	<cfif Trim(form.publishdate) NEQ "">
		<cfinvoke component="#application.objtimedateconversion#" method="datetoint" date="#form.publishdate#" hours="#form.publishhour#" minutes="#form.publishmin#" ampm="#form.publishampm#" returnvariable="form.postdate">
	</cfif>
	<cftransaction>
		<cfinvoke component="#application.objBlog#" method="addBlogEntry" argumentcollection="#form#" authorid="#client.masternameid#" lastupdatedby="#client.firstname# #client.lastname#" returnvariable="myBlogEntryid">
		<cfif form.entrystatus EQ "published">
			<cfif form.postdate GT application.objtimedateconversion.createtimedate()>
				<cfset publishtime=application.objtimedateconversion.converttime(form.postdate,"hh:mmtt")>
				<cfschedule action="update" URL="http://#CGI.SERVER_NAME#/content/blog/actions/publish.cfm?domain=#client.siteurl#" operation="HTTPRequest" startdate="#form.publishdate#" starttime="#publishtime#" interval="once" task="publish_blog_#myblogEntryid#">
			</cfif>
		</cfif>
		
		<cfloop list="#mybloglist#" index="blogid">
			<cfinvoke component="#application.objBlog#" method="addBlogEntrytoBlog" ds="#client.siteurl#" blogid="#blogid#" blogentryid="#myBlogEntryid#">
		</cfloop>
		
		<cfloop list="#myblogcategorieslist#" index="blogcategoryid">
			<cfinvoke component="#application.objBlog#" method="addBlogEntrytoBlogCategory" ds="#client.siteurl#" blogcategoryid="#blogcategoryid#" blogentryid="#myBlogEntryid#">
		</cfloop>
	</cftransaction>
	<!--- Set a message to let user know they have saved the Entry successfully --->
	<cfset client.message="The Blog Entry, #form.name# has been saved successfully.">
	<cfinclude template="/actions/tracking.cfm">
	<cflocation url="/cms/content/blog" addtoken="false">
<cfelse>
	<cflocation url="/cms/content/blog/addBlogEntry" addtoken="false">
</cfif>