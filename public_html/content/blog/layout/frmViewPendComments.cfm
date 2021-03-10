<cfparam name="url.blogid" default="0">
<cfparam name="url.blogcategoryid" default="0">
<cfparam  name="url.blogentryid" default="0">
<cfinvoke component="#application.objBlog#" method="getComments" ds="#client.siteurl#" returnVariable="myComments" blogcomment="1" status="Private">

<cfif myComments.recordCount EQ 0> 
	<div class="quicknote">
		<h1>There are currently no comments to approve,
		<a href="/cms/content/blog/viewBlogComments">click here</a> to view your comments.</h1>
	</div>	
<cfelse>
	<h1 style="float: left;">Comments</h1>
	<span style="float: left; margin: 10px 0 0 10px; text-decoration:none;">
		<a href="/cms/content/blog/viewblogComments">...back to commets</a>
	</span>
	
	<div class="clear"> </div>
	<form action="/cms/content/blog/updateBlogComment/?p=true" method="post" name="updateComment">
		<table class="datagrid" id="managePagesTable">
			 <tr class="titlebar">
				<th>&nbsp;</th>		
			</tr>
			<cfoutput query="myComments">
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
				<cfinvoke component="#application.objBlog#" method="getBlogEntries" blogentryid="#blogentryid#" blogcategoryid="#url.blogcategoryid#" ds="#client.siteurl#" returnVariable="getBlogEntries" >
				<td>
				<b>#BLOGENTRYCOMMENTYOURNAME#</b> | #BLOGENTRYCOMMENTEMAIL#
				<p>#comment#</p>
				#application.objtimedateconversion.convertDate(commentid, "mm/dd/yyyy")# 
				<input type="radio" id="comment#commentid#" name="comment_#commentid#" value="approve"> Approve 
				<input type="radio" id="comment#commentid#" name="comment_#commentid#" value="delete"  checked/> Delete
				<input type="radio" id="comment#commentid#" name="comment_#commentid#" value=""> No action 
				<strong> - Entry Name:</strong>
				<a href="/cms/content/blog/editblogEntry/?blogEntryId=#blogEntryId#" class="name">#getBlogEntries.name#</a>
				<cfif status EQ 'Deactive'>
					<a href="/cms/content/blog/restore/?blogEntryId=#blogEntryId#">Restore</a>
				</cfif>
				</td></tr>
			</cfoutput>
			<tr>
				<td><div> <input type="submit" value="Update Comments" name="submit"> </div></td>
			</tr>
		</table>
	</form>
</cfif>