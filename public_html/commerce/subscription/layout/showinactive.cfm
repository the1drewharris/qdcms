<cfoutput>
	<cfinvoke component="#application.objsubscription#" method="getInactiveSubscription" subscriptiondsn="#client.siteurl#" returnvariable="subscriptions">
	<cfif subscriptions.recordcount GT 0>
		<h1>Inactive Subscriptions</h1>
		<table class="datagrid" id="managePagesTable">
			<tr class="titlebar">
				<th>Subscription Plan</th>
				<th>User</th>
				<th>Renewal Date</th>
				<th>Date Renewed</th>
				<th>Subscribed For</th>
				<th>History</th>
				<th>Restore</th>
			</tr>
			<cfloop query="subscriptions">
			<tr>
				<cfset renewal_date=application.objtimedateconversion.convertDate(renewaldate,"mm/dd/yyyy")>
				<cfset renewal_time=application.objtimedateconversion.convertTime(renewaldate,"hh:mmtt")>
				<cfset date_renewed=application.objtimedateconversion.convertDate(daterenewed,"mm/dd/yyyy")>
				<cfset time_renewed=application.objtimedateconversion.convertTime(daterenewed,"hh:mmtt")>
				<cfset timetorenew=DateAdd("m",1,now())>
				<td>#itemname#
				<cfif timetorenew GT renewal_date>
					(<a href="/cms/#url.section#/#url.module#/renewsubscription/?s=#subscriptionid#">Renew</a>)
				</cfif>
				</td>
				<td>#firstname# #lastname#</td>
				<td>#renewal_date# #renewal_time#</td>
				<td>#date_renewed# #time_renewed#</td>
				<td>#term# #termmeasure#</td>
				<td><a href="/cms/#url.section#/#url.module#/showhistory/?s=#subscriptionid#">Show</a></td>
				<td align="center">
					<a href="/cms/#url.section#/#url.module#/activatesubscription/?s=#subscriptionid#">
						<img src="/siteimages/add-icon.gif">
					</a>
				</td>
			</tr>
			</cfloop>
		</table>
	<cfelse>
		<div class="quicknote">
			<h1>There are no inactive subscriptions</h1>
		</div>
	</cfif>
</cfoutput>