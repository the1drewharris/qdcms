<cfparam name="form.keyword" default="0">

<cfinvoke component="#application.objcontest#" method="getAllContest" returnvariable="contests" contestdsn="#client.siteurl#" criteria="#form.keyword#">
<cfoutput>
<cfif contests.recordcount EQ 0>
	<div class="quicknote">
		<cfif form.keyword NEQ "0">
			<h2>No results returned</h2>
		<cfelse>
			<h1>There are currently no Contests for this site. 
			<a href="/cms/content/contest/addcontest">Click here</a> to add your first Contest!</h1>
			<p>It is really easy!</p>
		</cfif>
	</div>
<cfelse>
	<h1 style="float: left;">Contest</h1>
		<span style="float: left; margin: 10px 0 0 10px">
			<a href="" id="copy" title="Copy checked Contest">Copy</a> 
			<a href="" id="delete" title="Delete checked Contest">Delete</a>
		</span>
		
		<span style="float: right; margin: 10px 10px 0 10px">
			<table>
				<tr>
					<form id="form" method="post" action="/cms/content/contest/?search=1">
					<td align="right"><label class="name">Search</label></td>
					<td align="right"><input name="keyword" type="text"></td>
					<td><input name="submit" type="submit" value="submit"></td>
					<td width="20px"></td>
					<td><a href="/cms/content/contest/addcontest" id="addcontest" title="Add Contest">+ Add Contest</a></td>
					</form>
				</tr>
			</table>
		</span>
		<div class="clear"> </div>
	<table class="datagrid" id="managePagesTable">
	
	<tr class="titlebar">
		<th class="checkbox"><input id="selectAll" type="checkbox" /></th>
		<th>Contest Description</th>
		<th>Start date</th>
		<th>Start time</th>
		<th>End date</th>
		<th>End Time</th>
		<th>View Entries</th>
	</tr>
	
	<tbody>
	<cfloop query="contests">
		<cfif currentRow MOD 2 EQ 0><tr class="alt"><cfelse><tr></cfif>
			<td><input type="checkbox" id="contest#contestid#" /></td>
			<td><a href="/cms/content/contest/editcontest/?contestid=#contestid#">#description#</a></td>
			<cfset start_date=application.objtimedateconversion.convertDate(startdate,"mm/dd/yyyy")>
			<cfset starttime=application.objtimedateconversion.convertTime(startdate,"hh:mmtt")>
			<td>#start_date#</td>
			<td>#starttime#</td>
			<cfset end_date=application.objtimedateconversion.convertDate(enddate,"mm/dd/yyyy")>
			<cfset endtime=application.objtimedateconversion.convertTime(enddate,"hh:mmtt")>
			<td>#end_date#</td>
			<td>#endtime#</td>
			<td><a href="/cms/content/contest/showentries/?contestid=#contestid#">View</a></td>
		</tr>
	</cfloop>
	</tbody>
	</table>
</cfif>
</cfoutput>


