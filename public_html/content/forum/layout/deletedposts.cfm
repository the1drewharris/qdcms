<cfparam name="url.s" default="0">
<cfparam name="url.t" default="0">

<cfif url.t NEQ 0>
	<cfset args=StructNew()>
	<cfset args.topicid=url.t>
	<cfset args.ds=client.siteurl>
	<cfinvoke component="#application.objforum#" method="isDeleted" argumentcollection="#args#" returnvariable="result">
<cfelse>
	<cfset result=0>
</cfif>

<cfoutput>
	<cfswitch expression="#result#">
		<cfcase value="0">
			<cfinvoke component="#application.objforum#" method="getPosts" ds="#client.siteurl#" lowerlimit="#url.s#" deleted="1" approved="-1" topicdeleted="1" resultsperpage="25" returnvariable="posts">
			<cfif NOT posts.recordCount>
				<div class="quicknote">
					<h1>There are currently no deleted Posts for this site.</h1>
				</div>	
			<cfelse>
				<h1 style="float: left;">Deleted Posts</h1>
				<span style="float: left; margin: 10px 0 0 10px">
					<a href="" id="restoreposts" title="Restore checked posts">Restore</a>
				</span>
				<div class="clear"> </div>
				
				<table class="datagrid" id="managePagesTable">
					<tr class="titlebar">
						<th class="checkbox"><input id="selectAll" type="checkbox" /></th>
						<th>Post Subject</th>
						<th>Posted By</th>
						<th>Posted On</th> 
					</tr>
					<cfloop query="posts">
						<tr class="alt">
							<td><input type="checkbox" id="forum#postid#" /></td>
							<td><a href="/cms/content/forum/viewpost/?postid=#postid#">#postsubject#</a></td>
							<td>#postername#</td>
							<td>#Application.objtimedateconversion.convertdate(posttime,"mmm dd, yyyy")# #application.objtimedateconversion.converttime(posttime,"h:mmtt")#</td>
						</tr>
					</cfloop>
					<tr>
						<cfinvoke component="#application.objforum#" method="getdeletedPostCount" ds="#client.siteurl#" returnvariable="deletedPostCount">
						<cfinvoke component="#application.objpagination#" method="get" prefixURL="/cms/content/forum/deletedposts/?s="  rowLabel="Posts" perPage="25" totalRows="#deletedPostCount#" delimeter="&bull;" currentValue="#url.s#" returnVariable="pagination"> 
						<td colspan="4">
							#pagination#
						</td>
					</tr>
				</table>
				<cfset client.pagetogo="/cms/content/forum/deletedposts/">
			</cfif>
		</cfcase>
		<cfdefaultcase>
			<cfinvoke component="#application.objforum#" method="getTopics" argumentcollection="#args#" deleted="-1" returnvariable="thistopic">
			<cfset args.lowerlimit=url.s>
			<cfset args.topicdeleted=1>
			<cfset noofposts=thistopic.noofreplies+1>
			<cfset nextlink="/cms/content/forum/deletedposts/?t=#url.t#&s=">
			<cfset args.resultsperpage=25>
			<cfset rowlabel="Posts">
			<cfinvoke component="#application.objforum#" method="getPosts" argumentcollection="#args#" returnvariable="posts">
			<h1 style="float: left;">#thistopic.topictitle#</h1>
			<cfinclude template="/content/forum/display/whatdeleted.cfm">
			<div class="clear"> </div>
			<table class="datagrid" width="910">
				<tr class="titlebar">
					<th>Post Subject</th>
					<th>Posted By</th>
					<th>Posted On</th>
				</tr>
				<cfloop query="posts">
					<tr>
						<td><a href="/cms/content/forum/viewpost/?postid=#postid#">#postsubject#</a></td></td>
						<td>#posts.postername#</td>
						<td>#Application.objtimedateconversion.convertdate(posttime,"mmm dd, yyyy")# #application.objtimedateconversion.converttime(posttime,"h:mmtt")#</td>
					</tr>
				</cfloop>
				<tr>
					<cfinvoke component="#application.objpagination#" method="get" prefixURL="#nextlink#"  rowLabel="#rowlabel#" perPage="#args.resultsperpage#" totalRows="#noofposts#" delimeter="&bull;" currentValue="#url.s#" returnVariable="pagination"> 
					<td colspan="6">
						#pagination#
					</td>
				</tr>
			</table>
		</cfdefaultcase>
	</cfswitch>
</cfoutput>