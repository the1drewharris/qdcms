<cfparam name="url.f" default="0">
<cfif (Trim(url.f) EQ 0) OR (url.f EQ 0)>
	<cflocation url="/cms/content/forum/showforums" addtoken="false">
</cfif>

<script type="text/javascript" src="/js/lib/content/forum/default.js"></script>
<cfinvoke component="#application.objforum#" method="getforums" ds="#client.siteurl#" forumid="#url.f#" returnvariable="thisforum">
<cfinvoke component="#application.objforum#" method="getChildren" ds="#client.siteurl#" status=1 forumid="#url.f#" returnvariable="children">
<cfif NOT children.recordCount>
	<div class="quicknote">
		<h1>There are currently no subforums for this forum. Either they do not exist or all the subforums are deleted. 
		<a href="/cms/content/forum/showforum">Click here</a> to go to main forum page!</h1>
	</div>	
<cfelse>
	<h1 style="float: left;"><cfoutput>#thisforum.name#</cfoutput>:Sub Forums</h1>
	<span style="float: left; margin: 10px 0 0 10px">
		<a href="" id="delete" title="Delete checked Forum">Delete</a>
		<a href="" id="moveforums" title="Move Forums">Move</a>
	</span>
	
	<span style="float: right; margin: 10px 10px 0 10px">
		<a href="/cms/content/forum/addforum" id="add forum" title="Add new forum">+ Add Forum</a>
	</span>
	<div class="clear"> </div>

	<table class="datagrid" id="managePagesTable">
		<tr class="titlebar">
			<th class="checkbox"><input id="selectAll" type="checkbox" /></th>
			<th>Name</th>
			<th>Description</th>
			<th>No of Topics</th> 
			<th>No of posts</th>
		</tr>
		<cfset row=1>
		<cfoutput query="children">
		<cfif row MOD 2 EQ 0>
			<tr class="alt">
		<cfelse>
			<tr>		
		</cfif>
			<td><input type="checkbox" id="forum#forumid#" /></td>
			<td><a href="/cms/content/forum/editforum/?forumid=#forumid#" class="name" title="Edit &quot;#name#&quot;"> 
			<cfif Trim(name) NEQ "">#name#</cfif>
			</a></td>
			<td>#description#</td>
			<td><a href="/cms/content/forum/showtopics/?f=#forumid#">#nooftopics#</td>
			<td>#noofposts#</td>
		</tr>
		<cfset row=row+1>
		</cfoutput>
	</table>
</cfif>