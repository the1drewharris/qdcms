<cfoutput>
<div id="pendingComments">
	<h3><a href="/cms/content/blog/viewPendBlogComments">Pending Blog Comments</a></h3>
	<dl>
		<cfloop query="pendingBlogComments">
			<cfinvoke component="#application.objBlog#" method="getBlogEntries" blogentryid="#blogentryid#" blogcategoryid="0" ds="#client.siteurl#" returnVariable="getBlogEntries" >
			<dt class="#commentid#">
				written by <a href="mailto:#blogentrycommentemail#">#BLOGENTRYCOMMENTYOURNAME#</a> on #application.objtimedateconversion.convertDate(commentid, "mmmm d, yyyy")# 								
			</dt>
			<dd>
				<strong>Comment: </strong> #comment#
			</dd>
		</cfloop>
	</dl>
</div>
</cfoutput>