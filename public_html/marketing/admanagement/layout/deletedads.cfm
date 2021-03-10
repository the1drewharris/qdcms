<cfoutput>
	<cfinvoke component="#application.objadmanagement#" method="getDeletedAds" returnvariable="bannerad" admanagementdsn="#client.siteurl#">
	<cfif bannerad.recordcount GT 0>
		<h1>Deleted Ads</h1>
		<table class="datagrid" width="910">
			<tr class="titlebar">
				<th>Name</th>
				<th>Zone</th>
				<th>Max<br />Clicks</th>
				<th>Current<br />Clicks</th>
				<th>Max<br />Impressions</th>
				<th>Current<br />Impressions</th>
				<th>Unique<br />Impressions</th>
				<th>Start Time</th>
				<th>End Time</th>
				<th>Report</th>
				<th>Restore</th>
			</tr>
			<cfloop query="bannerad">
				<cfinvoke component="#application.objadmanagement#" method="getCurrent" returnVariable="getCurrent" admanagementdsn="#client.siteurl#" adid="#adid#">
				<tr>
					<td>#adname#</td>
					<td>#description#</td>
					<td class="center">#maxclick#</td>
					
					<td align="center">
						<cfif getCurrent.recordCount GT 1>#getCurrent.noofclicks#<cfelse>0</cfif>
					</td>
					<td>#maximpression#</td>
					<td><cfif getCurrent.recordCount GT 0>#getCurrent.noofimpressions#<cfelse>0</cfif></td>
					<td><cfif getCurrent.recordCount GT 0>#getCurrent.noofuniqueimpressions#<cfelse>0</cfif></td>
					<td>#Application.objtimedateconversion.convertDate(startdate,"mm/dd/yy")# #Application.objtimedateconversion.convertTime(startdate,"hh:mmtt")#</td>
					<td>#Application.objtimedateconversion.convertDate(enddate,"mm/dd/yy")# #Application.objtimedateconversion.convertTime(enddate,"hh:mmtt")#</td>
				
					<td>
						<a href="/cms/marketing/admanagement/showimpressions/?adid=#adid#">Show</a>
					</td>
					<td align="center">
						<a href="/cms/marketing/admanagement/restoread/?adid=#adid#">Restore</a>
					</td>
				</tr>
			</cfloop>
		</table>
	<cfelse>
		<h1>There are no deleted ads</h1>
	</cfif>
</cfoutput>