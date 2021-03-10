<cfoutput>
	<cfinvoke component="#application.objsubscription#" method="getCurrentSubscription" subscriptiondsn="#client.siteurl#" returnvariable="subscriptions">
	<cfif subscriptions.recordcount GT 0>
		<h1>Active Subscriptions</h1>
		<table class="datagrid" id="managePagesTable">
			<tr class="titlebar">
				<th>Plan</th>
				<th>User</th>
				<th>Renewal Date</th>
				<th>Date Renewed</th>
				<th>Subscribed For</th>
				<th>History</th>
				<th>Deactivate</th>
				<th>Cancel/Restore</th>
			</tr>
			<cfloop query="subscriptions">
				<cfset renewal_date=application.objtimedateconversion.convertDate(renewaldate,'mm/dd/yyyy')>
				<cfset renewal_time=application.objtimedateconversion.convertTime(renewaldate,'hh:mmtt')>
				<cfset date_renewed=application.objtimedateconversion.convertDate(daterenewed,'mm/dd/yyyy')>
		  		<cfset time_renewed=application.objtimedateconversion.convertTime(daterenewed,'hh:mmtt')>
				<cfif currentRow MOD 2 EQ 0><tr class="alt"><cfelse><tr></cfif>
					<td>
						#itemname#
						<cfset timetorenew=DateAdd("m",1,now())>
						<cfif timetorenew GT renewal_date>
							(<a href="/cms/#url.section#/#url.module#/renewsubscription/?s=#subscriptionid#">Renew</a>)
						</cfif>		
					</td>
					<td>#firstname# #lastname# #company#</td>
			  		<td>#renewal_date# #renewal_time#</td>
					<td>#date_renewed# #time_renewed#</td>
					<td align="center">#term# #termmeasure#</td>
					<td align="center">
						<a href="/cms/#url.section#/#url.module#/showhistory/?s=#subscriptionid#">
							Show
						</a>
					</td>
					<td align="center">
						<a href="/cms/#url.section#/#url.module#/deactivatesubscription/?s=#subscriptionid#">
							<img src="/siteimages/delete.png">
						</a>
					</td>
					<td align="center">
						<cfif cancelled EQ 0>
							<a href="/cms/#url.section#/#url.module#/cancelsubscription/?s=#subscriptionid#">
								Cancel
							</a>
						<cfelse>
							<a href="/cms/#url.section#/#url.module#/revokecancellation/?s=#subscriptionid#">
								Restore
							</a>
						</cfif>
					</td>
				</tr>
			</cfloop>
		</table>
	<cfelse>
		<div class="quicknote">
			<h1>There are are no active subscriptions</h1>
		</div>
	</cfif>
</cfoutput>