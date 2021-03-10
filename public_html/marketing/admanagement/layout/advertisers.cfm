<cfinvoke component="#application.objadmanagement#" method="deActivateExpired" admanagementdsn="#client.siteurl#">
<cfinvoke component="#application.objadmanagement#" method="getAdvertiserInfo" admanagementdsn="#client.siteurl#" returnVariable="getAdvertiserInfo">

<table class="datagrid" width="910">
<tr class="titlebar">
	<th>Advertiser</th>
	<th>Active Ads</th>
	<th>Future Ads</th>
	<th>Inactive Ads</th>
</tr>
<cfoutput query="getAdvertiserInfo">
	<tr>
		<td>
			<a href="/cms/marketing/admanagement/advertiserdashboard/?advertiserID=#nameid#">#company#</a>
		</td>
		<td>
			<cfif len(active_count)>#active_count#<cfelse>0</cfif>
		</td>
		<td>
			<cfif len(inactive_count)>#future_count#<cfelse>0</cfif>
		</td>
		<td>
			<cfif len(inactive_count)>#inactive_count#<cfelse>0</cfif>
		</td>
	</tr>
</cfoutput>
</table>
