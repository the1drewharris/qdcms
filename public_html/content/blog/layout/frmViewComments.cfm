<cfparam name="url.s" default="0">
<cfset url.s=url.s+1>
<cfset noofentries=4>
<cfset prefixurl="/cms/content/blog/viewBlogComments/?s=">
<cfif entryauthorid NEQ 0>
	<cfinvoke component="#application.objBlog#" method="getBlogentryList" ds="#client.siteurl#" authorid="#entryauthorid#" returnVariable="blogentrylist">
<cfelse>
	<cfset blogentrylist=0>
</cfif>
<cfset pendingcommentcount=application.objBlog.getPendingCommentsCount(client.siteurl,blogentrylist)>
<cfinvoke component="#application.objBlog#" method="getBlogCommentsCount" ds="#client.siteurl#" blogcomment="1" blogentrylist="#blogentrylist#" returnVariable="commentscount">
<cfif url.s GT commentscount>
	<cfset url.s=1>
</cfif>
<cfinvoke component="#application.objBlog#" method="getBlogComments" ds="#client.siteurl#" blogcomment="1" currentcount="#url.s#" noofcomments="#noofentries#" blogentrylist="#blogentrylist#" returnVariable="myEntryComments">

<cfoutput>
	<cfif myEntryComments.recordCount EQ 0>
		<div class="quicknote">
			<cfif pendingcommentcount NEQ 0>
				<h1>You have (#pendingcommentcount#) pending comments waiting to be appoved, 
				<a href="/cms/content/blog/viewPendComments">click here</a> to approve your comments.</h1>
			<cfelse>
				<h1>There are no comments for your blog entries. 
				<a href="/cms/content/blog/viewBlogEntries">Click here</a> to view your blog entries.</h1>
			</cfif>
		</div>	 
	<cfelse>
		<h1 style="float: left;">Comments</h1>
		<span style="float: left; margin: 10px 0 0 10px; text-decoration:none;">
			<a href="/cms/content/blog/viewPendBlogComments"> (#pendingcommentcount#) Pending Comments</a>
		</span>
		<div class="clear"> </div>
	
		<table class="datagrid" id="managePagesTable">
			 <tr class="titlebar">
				<th>
					<cfif commentscount GT noofentries>
						<cfinvoke component="#application.objpagination#" method="get" perpage="#noofentries#" currentvalue="#url.s#" totalrows="#commentscount#" prefixURL="#prefixurl#" returnvariable="pagination">
						#pagination#
					</cfif>
				</th>		
			</tr>
			<cfloop query="myEntryComments">
				<cfif currentRow MOD 2 EQ 0>
					<cfif Status EQ 'Deactive'>
						<tr class="alt-deleted">
					<cfelse>
						<tr class="alt">
					</cfif>
				<cfelse>
					<cfif Status EQ 'Deactive'>
						<tr class="deleted">
					<cfelse>
						<tr>
					</cfif>
				</cfif>
				<cfset entryname=application.objBlog.getBlogEntryName(client.siteurl,blogentryid)>
				<td>
					<b>#BLOGENTRYCOMMENTYOURNAME#</b> | #BLOGENTRYCOMMENTEMAIL#
					<p>#comment#</p>
					&mdash;#application.objtimedateconversion.convertDate(commentid, "mm/dd/yyyy")# 
					[ <a href="/cms/content/blog/updateblogcomment?s=d&c=#commentid#">Delete Comment</a> ]
					<a href="/cms/content/blog/editblogEntry/?blogEntryId=#blogEntryId#" class="name"> 
					#entryname#
					</a>
				</td>
			</tr>
			</cfloop>
		</table>
	</cfif>
</cfoutput>