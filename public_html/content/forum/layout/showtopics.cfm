<cfparam name="url.s" default="0">
<cfset perpage=25>
<cfinvoke component="#application.objforum#" method="getforums" ds="#client.siteurl#" forumid="#url.f#" returnvariable="thisforum">
<cfinvoke component="#application.objforum#" method="getTopics" ds="#client.siteurl#" topicsperpage="#perpage#" forumid="#url.f#" lowerlimit="#url.s#" returnvariable="topics">
<cfif NOT topics.recordCount>
	<div class="quicknote">
		<h1>There are currently no topics for this forum. 
	</div>	
<cfelse>
	<h1 style="float: left;">Topics: <cfoutput>#thisforum.name#</cfoutput></h1>
	<span style="float: left; margin: 10px 0 0 10px">
		<a href="" id="movetopics" title="Move checked topics">Move</a>
		<a href="" id="deletetopics" title="Delete checked topics">Delete</a>
	</span>
	<div class="clear"> </div>
	<table class="datagrid" id="managePagesTable">
		<tr class="titlebar">
			<th class="checkbox"><input id="selectAll" type="checkbox" /></th>
			<th>Title</th>
			<th>Created By</th>
			<th>Created on</th>
			<th>No of Replies</th>
			<th>No of Views</th> 
		</tr>
		<cfoutput query="topics">
		<tr class="alt">
			<td><input type="checkbox" id="forum#topicid#" /></td>
			<td><a href="/cms/content/forum/edittopic/?t=#topicid#&s=#url.s#" class="name" title="Edit &quot;#topictitle#&quot;">#topictitle#</a></td>
			<td>#topicpostername#</td>
			<td>#application.objtimedateconversion.convertdate(createdon,"mmm dd, yyyy")# #application.objtimedateconversion.converttime(createdon,"h:mmtt")#</td>
			<td><a href="/cms/content/forum/showposts/?t=#topicid#">#noofreplies#</a></td>
			<td>#noofviews#</td>
		</tr>
		</cfoutput>
		<tr>
		<cfinvoke component="#application.objforum#" method="getforums" ds="#client.siteurl#" forumid="#url.f#" returnvariable="thisforum">
		<cfinvoke component="#application.objpagination#" method="get" prefixURL="/cms/content/forum/showtopics/?f=#url.f#&s="  rowLabel="topics" perPage="#perpage#" totalRows="#thisForum.noOfTopics#" delimeter="&bull;" currentValue="#url.s#" returnVariable="pagination"> 
		<cfoutput>
			<td colspan="6">
				#pagination#
			</td>
		</cfoutput>
		</tr>
	</table>
</cfif>

<cfset client.pagetogo="/cms/content/forum/showtopics/?f=#url.f#">