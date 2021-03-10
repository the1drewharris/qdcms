<h1>List of Zones</h1>
<cfinvoke component="#Application.objadmanagement#" method="deActivateExpired" admanagementdsn="#client.siteurl#">
<cfinvoke component="#Application.objadmanagement#" method="getAllZones" returnvariable="Zones" admanagementdsn="#client.siteurl#">
<table class="datagrid admanagement">
<tr class="titlebar">
	<th> </th>
	<th width="350">Description</th>
	<th>Total Ads</th>
	<th>Active Ads</th>
	<th>Inactive Ads</th>
	<th>Future Ads</th>
	<th>Width</th>
	<th>Height</th>
</tr>
<cfoutput query="Zones">
	<tr>
		<td class="status">
			<cfif totalads EQ 0><div class="expired">No Ads</div>
			<cfelseif activeads EQ 0><div class="warning">No Active Ads</div></cfif>
		</td>
		<td>
			<cfif totalads GT 0>
			<a href="/cms/marketing/admanagement/zonedashboard/?zoneid=#zoneid#">
			</cfif>
				#description#
			<cfif totalads GT 0>
			</a>
			</cfif>
		</td>
		<td>#totalads#</td>
		<td>#activeads#</td>
		<td>#inactiveads#</td>
		<td>#futureads#</td>
		<td>#width#</td>
		<td>#height#</td>
	</tr>
</cfoutput>
</table>
