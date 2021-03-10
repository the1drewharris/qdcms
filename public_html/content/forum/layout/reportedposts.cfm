<cfoutput>
	<cfinvoke component="#application.objforum#" method="getReportedPosts" ds="#client.siteurl#" returnvariable="reportedPosts">
	<cfif reportedPosts.recordcount GT 0>
	<h1 style="float: left;">Reported Posts</h1>
	<span style="float: left; margin: 10px 0 0 10px">
		<a href="" id="deleteposts" title="Delete checked posts">Delete</a>
		<a href="" id="ignorereport" title="Ignore report">Ignore</a>
	</span>
	<div class="clear"> </div>
	<cfset count=0>
	<table class="datagrid" id="managePagesTable">
		<tr class="titlebar">
			<th class="checkbox"><input id="selectAll" type="checkbox"></th>
			<th>Post Subject</th>
			<th>Posted By</th>
			<th>Posted On</th>
			<th>Reported By</th>
		</tr>
		<cfloop query="reportedposts">
			<tr <cfif (count mod 2) EQ 1>class="alt"</cfif>>
				<td><input type="checkbox" id="forum#postid#"></td>
				<td><a href="/cms/content/forum/viewpost/?postid=#postid#">#postsubject#</a></td>
				<td>#postername#</td>
				<td>#Application.objtimedateconversion.convertdate(posttime,"mmm dd, yyyy")# #application.objtimedateconversion.converttime(posttime,"h:mmtt")#</td>
				<td>#reportedby#</td>
			</tr>
			<cfset count=count+1>
		</cfloop>
	</table>
	<cfelse>
		<div class="quicknote">
			<h1>There are no posts reported as inappropriate</h1>
		</div>	
	</cfif>
</cfoutput>
<cfset client.pagetogo="/cms/content/forum/reportedposts">