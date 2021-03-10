<cftransaction>
	<cfloop list="#url.blogEntryList#" index="blogEntryId">
		<cfinvoke component="#application.objBlog#" method="getBlogEntries" ds="#client.siteurl#" blogentryid="#blogEntryId#" returnVariable="getMyEntries" />
		<cfif getMyEntries.recordcount GT 0>
			<cfset args=structNew()>
			<cfset args.ds=client.siteurl>
			<cfset args.name="Copy of #getMyEntries.name#">
			<cfset args.authorid=client.masternameid>
			<cfset args.lastupdatedby="#client.firstname# #client.lastname#">
			<cfset args.entry=getMyEntries.entry>
			<cfset args.title=getMyEntries.title>
			<cfset args.keywords=getMyEntries.keywords>
			<cfset args.status=getMyEntries.entrystatus>
			<cfset args.postdate=getMyEntries.postdate>
			<cfset args.description=getMyEntries.description>
			<cfinvoke component="#application.objBlog#" method="addBlogEntry" argumentcollection="#args#" />
		<cfelse>
			<cfset client.message="Some blog entries could not be copied. They may have been deactivated.">
		</cfif>
	</cfloop>
	<cfinvoke component="#application.objBlog#" method="createRSS" domain="#client.siteurl#">
	<cfinvoke component="#application.objBlog#" method="createRSSforBlogs" domain="#client.siteurl#">
</cftransaction>
<cfinclude template="/actions/tracking.cfm">
<cflocation url="/cms/content/blog/viewBlogEntries" addToken="false"> 