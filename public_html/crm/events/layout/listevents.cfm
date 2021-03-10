<cfparam name="url.k" default="">
<cfparam name="url.s" default=0>
<cfparam name="url.c" default=0>
<cfset args=StructNew()>
<cfset args.eventdsn=client.siteurl>
<cfset args.noofentries=20>
<cfset args.startrow=url.s+1>
<cfset args.category=url.c>
<cfif  Trim(url.k) NEQ ''>
	<cfset args.keyword=url.k>
	<cfset title="Search Results">
	<cfset prefixurl="/cms/crm/events/listevents/?k=#url.k#&c=#url.c#&s=">
<cfelse>
	<cfset title="Event Listings">
	<cfset prefixurl="/cms/crm/events/listevents/?s=">
</cfif>

<cfinvoke component="#application.objevent#" method="searchEventsCount" argumentcollection="#args#" returnvariable="count">
<cfinvoke component="#application.objpagination#" method="get" perpage="#args.noofentries#" currentValue="#args.startrow#" totalrows="#count#" prefixURL="#prefixurl#" returnvariable="pagination">
<cfinvoke component="#Application.objEvent#" method="searchEvents" argumentcollection="#args#" returnvariable="eventlist">
<cfoutput>
	<cfif eventlist.recordcount NEQ 0>
		<cfset dateformat = "mmm dd, yyyy">
		<table class="datagrid" id="managePagesTable">
			<tr class="titlebar">
				<th>Event Name</th>
				<th>Status</th>
				<th>Start Date/Time</th>
			</tr>
			<cfloop query="eventlist">
				<cfif currentRow MOD 2 EQ 0><tr><cfelse><tr class="alt"></cfif>
					<td><a href="/cms/crm/events/editEvent/?eventid=#eventinstanceid#">#eventname#</a></td>
					<td>#status#</td>
					<td><cfif Trim(starttime) NEQ "">#Application.objtimedateconversion.convertDate(starttime,dateformat)#<cfelse>Not Set</cfif></td>
				</tr>
			</cfloop>
			<tr>
				<td colspan="3" align="right">#pagination#</td>
			</tr>
		</table>
	<cfelse>
		<div class="quicknote">
			<h1>No event meeting the search criteria was found</h1>
		</div>
	</cfif>	
</cfoutput>