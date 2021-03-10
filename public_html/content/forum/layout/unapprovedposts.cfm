<cfinvoke component="#application.objforum#" method="getPosts" ds="#client.siteurl#" approved="0" returnvariable="unapprovedposts">
<cfoutput>
	<cfif NOT unapprovedposts.recordCount>
		<div class="quicknote">
			<h1>There are currently no unapproved posts for this site. 
			<a href="/cms/content/forum/showforums">Click here</a> to view your forums!</h1>
		</div>	
	<cfelse>
		<h1 style="float: left;">Unapproved Posts</h1>
		<span style="float: left; margin: 10px 0 0 10px">
			<a href="" id="deleteposts" title="Delete checked Posts">Deleteposts</a>
			<a href="" id="approveposts" title="Approve checked Posts">Approveposts</a>
		</span>
		<span style="float: right; margin: 10px 10px 0 10px">
			<a href="/cms/content/forum/addforum" id="add forum" title="Add new forum">+ Add Forum</a>
		</span>
		<div class="clear"> </div>
	
		<table class="datagrid" id="managePagesTable">
			<tr class="titlebar">
				<th class="checkbox"><input id="selectAll" type="checkbox" /></th>
				<th width="250">Subject</th>
				<th>Post Text</th>
				<th>Posted By</th> 
				<th width="150">Post Date</th>
			</tr>
			<cfloop query="unapprovedposts">
				<cfif currentRow MOD 2 EQ 0>
					<tr class="alt">
				<cfelse>
					<tr>
				</cfif>
					<td><input type="checkbox" id="forum#postid#" /></td>
					<td>
						<a href="/cms/content/forum/viewpost/?postid=#postid#">#postsubject#</a>
					</td>
					<td>#posttext#</td>
					<td><a href="/cms/addressbook/">#postername#</td>
					<td>#Application.objtimedateconversion.convertDate(posttime,"yyyy/mm/dd")# #Application.objtimedateconversion.convertTime(posttime,"hh:mmtt")#</td>
				</tr>
			</cfloop>
		</table>
	</cfif>
</cfoutput>