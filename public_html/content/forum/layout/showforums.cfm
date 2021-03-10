<cfinvoke component="#application.objforum#" method="getForums" ds="#client.siteurl#" choice=0 returnvariable="forums">
<cfquery name="makeTree" dbtype="query">
	SELECT 
		PARENTID AS PARENT,
		FORUMID AS ID,
		FORUMID,
		FORUMID AS NESTLEVEL,
		NAME,
		NOOFPOSTS,
		NOOFSUBFORUMS,
		NOOFTOPICS,
		DESCRIPTION,
		STATUS
	FROM FORUMS
	ORDER BY NAME ASC
</cfquery>
<cfinvoke component="tree" method="makeBranches" theQuery="#makeTree#" nestLevel="0" returnVariable="forumsWithNesting" />
<cfif NOT forums.recordCount>
	<div class="quicknote">
		<h1>There are currently no forums for this site. 
		<a href="/cms/content/forum/addforum">Click here</a> to add your first forum!</h1>
		<p>It is really easy</p>
	</div>	
<cfelse>
	<h1 style="float: left;">Forums</h1>
	<span style="float: left; margin: 10px 0 0 10px">
		<a href="" id="delete" title="Delete checked Blogs">Delete</a>
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
			<th>Sub Forums</th>
			<th>Topics</th> 
			<th>Posts</th>
		</tr>
		<cfoutput query="forumsWithNesting">
		<cfif currentRow MOD 2 EQ 0>
			<tr class="alt">
		<cfelse>
			<tr>		
		</cfif>
			<td><input type="checkbox" id="forum#forumid#" /></td>
			<td class="title" style="width: 175px;"><a href="/cms/content/forum/editforum/?forumid=#forumid#" class="name" title="Edit &quot;#name#&quot;"> 
			<cfloop from="1" to="#nestLevel#" index="i"> &mdash; </cfloop><cfif Trim(name) NEQ "">#name#</cfif>
			</a></td>
			<td>#description#</td>
			<td><cfif noofsubforums GT 0><a href="/cms/content/forum/showsubforums/?f=#forumid#">#noofsubforums#</a><cfelse>0</cfif></td>
			<td><cfif (nooftopics GT 0) AND (noofsubforums EQ 0)><a href="/cms/content/forum/showtopics/?f=#forumid#">#nooftopics#</a><cfelse>#nooftopics#</cfif></td>
			<td>#noofposts#</td>
		</tr>
		</cfoutput>
	</table>
</cfif>