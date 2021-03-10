<cfparam name="url.s" default="0">
<cfparam name="url.f" default="0">

<cfif url.f GT 0>
	<cfset args=StructNew()>
	<cfset args.ds=client.siteurl>
	<cfset args.forumid=url.f>
	<cfinvoke component="#application.objforum#" method="isDeleted" argumentcollection="#args#" returnvariable="result">
<cfelse>
	<cfset result=0>
</cfif>

<cfswitch expression="#result#">
	<cfcase value="0">
		<cfset perpage=25>
		<cfinvoke component="#application.objforum#" method="getTopics" topicsperpage="#perpage#" deleted="1" approved="-1" ds="#client.siteurl#" lowerlimit="#url.s#" returnvariable="topics">
		<cfif NOT topics.recordCount>
			<div class="quicknote">
				<h1>There are currently no explicitly deleted topics</h1>
			</div>	
		<cfelse>
			<h1 style="float: left;">Deleted Topics</h1>
			<span style="float: left; margin: 10px 0 0 10px">
				<a href="" id="restoretopics" title="Restore checked topics">Restore</a>
			</span>
			<div class="clear"></div>
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
					<td>#topictitle#</td>
					<td>#topicpostername#</td>
					<td>#application.objtimedateconversion.convertdate(createdon,"mmm dd, yyyy")# #application.objtimedateconversion.converttime(createdon,"h:mmttt")#</td>
					<td><a href="/cms/content/forum/deletedposts/?t=#topicid#">#noofreplies#</a></td>
					<td>#noofviews#</td>
				</tr>
				</cfoutput>
				<tr>
					<cfinvoke component="#application.objforum#" method="getdeletedTopicCount" ds="#client.siteurl#" returnvariable="count">
					<cfinvoke component="#application.objpagination#" method="get" prefixURL="/cms/content/forum/deletedtopics/?s="  rowLabel="Topics" perPage="#perpage#" totalRows="#count#" delimeter="&bull;" currentValue="#url.s#" returnVariable="pagination"> 
					<cfoutput>
						<td colspan="5">#pagination#</td>
					</cfoutput>
				</tr>
			</table>
		</cfif>
		<cfset client.pagetogo="/cms/content/forum/deletedtopics/">
	</cfcase>
	<cfdefaultcase>
		<cfset args.topicsperpage=25>
		<cfset args.lowerlimit=url.s>
		<cfif result EQ 4>
			<cfset args.status=1>
		<cfelse>
			<cfset args.status=0>
		</cfif>
		<cfinvoke component="#application.objforum#" method="getForums" ds="#args.ds#" forumid="#args.forumid#" status="#args.status#" returnvariable="thisforum">
		<cfinvoke component="#application.objforum#" method="getTopics" argumentcollection="#args#" returnvariable="topics">
		<h1 style="float: left;">Topics for: <cfoutput>#thisforum.name#</cfoutput></h1>
		<cfinclude template="/content/forum/display/whatdeleted.cfm">
		<div class="clear"></div>
		<table class="datagrid" width="910">
			<tr class="titlebar">
				<th>Title</th>
				<th>Created By</th>
				<th>Date Created</th>
				<th>No of Replies</th>
				<th>No of Views</th>
			</tr>
			<cfoutput query="topics">
			<tr>
				<td>#topictitle#</td>
				<td>#topicpostername#</td>
				<td>#application.objtimedateconversion.convertdate(createdon,"mmm dd, yyyy")# #application.objtimedateconversion.converttime(createdon,"h:mmtt")#</td>
				<td><a href="/cms/content/forum/deletedposts/?t=#topicid#">#noofreplies#</a></td>
				<td>#noofviews#</td>
			</tr>
			</cfoutput>
			<cfinvoke component="#application.objpagination#" method="get" prefixURL="/cms/content/forum/deletedtopics/?f=#url.f#&s="  rowLabel="Topics" perPage="25" totalRows="#thisForum.nooftopics#" delimeter="&bull;" currentValue="#url.s#" returnVariable="pagination"> 
			<cfoutput>
				<td colspan="6">
					#pagination#
				</td>
			</cfoutput>
			</tr>
		</table>
	</cfdefaultcase>
</cfswitch>
