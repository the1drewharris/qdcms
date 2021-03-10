<cfoutput><cfinvoke component="#application.objhau#" method="getevents" haudsn="#client.siteurl#" returnvariable="events"></cfoutput>
	<table class="datagrid" id="managePagesTable">
		<tr class="titlebar">
			<th>Event</th>
			<th>Report</th>
		</tr>
		<cfoutput query="events" group="eventid">
			<cfif currentRow MOD 2 EQ 0>
				<tr class="alt">
			<cfelse>
				<tr>
			</cfif>
			<td>
				<a href="/cms/marketing/heardaboutus/hautoevent/?e=#eventid#">#eventname#</a>			
			</td>
			<td>
				<a href="/cms/marketing/heardaboutus/showreport/?e=#eventid#">Show</a>
			</td>
		</cfoutput>
	</table>