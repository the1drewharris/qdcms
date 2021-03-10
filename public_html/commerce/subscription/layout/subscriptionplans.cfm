<cfoutput>
	<cfinvoke component="#application.objsubscription#" method="getsubscriptionplans" subscriptiondsn="#client.siteurl#" returnvariable="subscriptionplans">
	<cfif subscriptionplans.recordcount GT 0>
		<h1 style="float:left">Subscription Plans</h1>
		<span class="right"><a href="/cms/#url.section#/#url.module#/addsubscriptionplan"> + Add Subscription Plan</span>
		<table class="datagrid" id="managePagesTable">
			<tr class="titlebar">
				<th>Plan Name</th>
				<th>Term</th>
				<th>Usable Minutes</th>
				<th>On Sale</th>
				<th></th>
			</tr>
			<cfloop query="subscriptionplans">
			<tr>
				<td>
					<a href="/cms/#url.section#/#url.module#/editsubscriptionplan/?s=#id#">
					#itemname#
					</a>
				</td>
				<td>#term# #termmeasure#</td>
				<td><cfif usableminutes NEQ 0>#usableminutes#<cfelse>Unlimited</cfif></td>
				<td><cfif stopselling EQ 0>Yes<cfelse>No</cfif></td>
				<td><a href="/cms/#url.section#/#url.module#/setprice/?id=#id#">Set Price</a></td>
			</tr>
			</cfloop>
		</table>
	<cfelse>
		<div class="quicknote">
			<h1>
				There are no subscription plans added yet. <a href="/cms/#url.section#/#url.module#/addsubscriptionplan">Click here</a> to a subscription plan
			</h1>
		</div>
	</cfif>
</cfoutput>