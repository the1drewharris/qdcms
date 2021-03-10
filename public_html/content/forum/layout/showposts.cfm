<cfparam name="url.s" default="0">
<cfparam name="url.searchby" default="keywords">
<cfparam name="url.searchword" default="">
<cfparam name="url.postid" default="">
<cfparam name="url.t" default="0">

<cfset args=StructNew()>
<cfset args.ds=client.siteurl>
<cfset args.resultsperpage=25>
<cfset search=0>
<cfset rowlabel="posts">
<cfif url.t NEQ 0>
	<cfset args.topicid=url.t>
	<cfset nextlink="/cms/content/forum/showposts/?t=#url.t#&s=">
	<cfinvoke component="#application.objforum#" method="gettopics" ds="#client.siteurl#" topicid="#url.t#" returnvariable="thistopic">
	<cfset noofposts=thistopic.noofreplies+1>
<cfelse>
	<cfswitch expression="#url.searchby#">
		<cfcase value="keywords">
			<cfif Trim(url.searchword) EQ "">
				<cflocation url="#CGI.HTTP_REFERER#" addtoken="false">
			</cfif>
			<cfset search=1>
			<cfset nextlink="/cms/content/forum/showposts/?searchby=keywords&searchword=#url.searchword#&s=">
			<cfset args.keywords=url.searchword>
		</cfcase>
		<cfcase value="username">
			<cfset search=1>
			<cfset nextlink="/cms/content/forum/showposts/?searchby=username&searchword=#url.searchword#&s=">
			<cfset args.authorList=url.searchword>	
		</cfcase>
		<cfcase value="postid">
			<cfif isNumeric(url.searchword)>
				<cfset args.postid=url.searchword>
			<cfelse>
				<cfset args.postid=1>
			</cfif>
		</cfcase>
	</cfswitch>
</cfif>

<cfset args.lowerlimit=url.s>

<cfif search EQ 1>
	<cfinvoke component="#application.objforum#" method="searchForum" argumentcollection="#args#" returnvariable="posts">
	<cfinvoke component="#application.objforum#" method="searchResultCount" argumentcollection="#args#" returnvariable="noofposts">
<cfelse>
	<cfinvoke component="#application.objforum#" method="getPosts" argumentcollection="#args#" returnvariable="posts">
</cfif>

<h1 style="float: left;"><cfif search EQ 1>Search Results for:<cfoutput>#url.searchword#</cfoutput><cfelse>Posts</cfif></h1>
<span style="float: left; margin: 10px 0 0 10px">
	<a href="" id="moveposts" title="Move checked posts">Move</a>
	<a href="" id="deleteposts" title="Delete checked posts">Delete</a>
</span>
<div class="clear"> </div>

<table class="datagrid" id="managePagesTable">
	<tr class="titlebar">
		<th class="checkbox"><input id="selectAll" type="checkbox" /></th>
		<th>Post Subject</th>
		<th>Posted By</th>
		<th>Posted On</th> 
	</tr>
	<cfoutput query="posts">
	<tr class="alt">
		<td><input type="checkbox" id="forum#postid#" /></td>
		<td><a href="/cms/content/forum/editpost/?p=#postid#">#postsubject#</a></td>
		<td>#postername#</td>
		<td>#Application.objtimedateconversion.convertdate(posttime,"mmm dd, yyyy")# #application.objtimedateconversion.converttime(posttime,"h:mmtt")#</td>
	</tr>
	</cfoutput>
	<cfif Trim(url.searchby) NEQ "postid">
	<tr>
		<cfinvoke component="#application.objpagination#" method="get" prefixURL="#nextlink#"  rowLabel="#rowlabel#" perPage="#args.resultsperpage#" totalRows="#noofposts#" delimeter="&bull;" currentValue="#url.s#" returnVariable="pagination"> 
		<cfoutput>
			<td colspan="6">
				#pagination#
			</td>
		</cfoutput>
	</tr>
	</cfif>
</table>
<cfset client.pagetogo="/cms/content/forum/showposts/?t=#url.t#">
