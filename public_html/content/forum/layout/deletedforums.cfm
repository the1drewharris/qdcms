<cfparam name="url.parentid" default="0">
<cfswitch expression="#url.parentid#">
	<cfcase value="0">
		<cfinvoke component="#application.objforum#" method="getforums" ds="#client.siteurl#" status="0" returnvariable="forums">
		<cfset currentpage=1>
		<cfif NOT forums.recordCount>
			<div class="quicknote">
				<h1>There are currently no deleted forums for this site.</h1>
			</div>	
		<cfelse>
			<h1 style="float: left;">Deleted Forums</h1>
			<span style="float: left; margin: 10px 0 0 10px">
				<a href="" id="restoreforums" title="Restore Checked Forums">Restore</a>
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
				<cfoutput query="forums">
				<cfif currentRow MOD 2 EQ 0>
					<tr class="alt">
				<cfelse>
					<tr>
				</cfif>
					<td><input type="checkbox" id="forum#forumid#" /></td>
					<td><cfif noofsubforums GT 0><a href="/cms/content/forum/deletedforums/?parentid=#forumid#">#name#</a><cfelse>#name#</cfif></td>
					<td>#description#</td>
					<td><cfif noofsubforums EQ 0><a href="/cms/content/forum/deletedtopics/?f=#forumid#">#nooftopics#</a><cfelse>#nooftopics#</cfif></td>
					<td>#noofposts#</td>
				</tr>
				</cfoutput>
				<tr>
				<cfinvoke component="#application.objforum#" method="getdeletedforumCount" ds="#client.siteurl#" returnvariable="count">
				<cfinvoke component="#application.objpagination#" method="get" prefixURL="/cms/content/forum/deletedforums/?s="  rowLabel="Forum" perPage="25" totalRows="#count#" delimeter="&bull;" currentValue="#currentpage#" returnVariable="pagination"> 
				<cfoutput>
					<td colspan="5">
						#pagination#
					</td>
				</cfoutput>
				</tr>
			</table>
		</cfif>
	</cfcase>
	<cfdefaultcase>
		<cfset args.ds=client.siteurl>
		<cfset args.forumid=url.parentid>
		<cfinvoke component="#application.objforum#" method="isDeleted" argumentcollection="#args#" returnvariable="result">
		<cfinvoke component="#application.objforum#" method="getforums" argumentcollection="#args#" status="0" returnvariable="thisforum">
		<cfinvoke component="#application.objforum#" method="getchildren" argumentcollection="#args#" status="-1" returnvariable="children">
		<h1 style="float: left;">Subforums for:<cfoutput>#thisforum.name#</cfoutput></h1>
		<cfinclude template="/content/forum/display/whatdeleted.cfm">
		<table class="datagrid" width="910">
			<tr class="titlebar">
				<th>Name</th>
				<th>Description</th>
				<th>No of Topics</th>
				<th>No of Posts</th>
			</tr>
			<cfoutput query="children">
				<tr>
					<td>#name#</td>
					<td>#description#</td>
					<td><a href="/cms/content/forum/deletedtopics/?f=#forumid#">#nooftopics#</td>
					<td>#noofposts#</td>
				</tr>
			</cfoutput>
		</table>
	</cfdefaultcase>
</cfswitch>