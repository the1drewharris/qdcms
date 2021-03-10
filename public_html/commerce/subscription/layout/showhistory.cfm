<cfoutput>
	<cfparam name="url.s" default="0">
	<cfif isNumeric(url.s) AND url.s NEQ 0>
		<cfinvoke component="#application.objsubscription#" method="getsubscriptionhistory" subscriptiondsn="#client.siteurl#" subscriptionid="#url.s#" returnvariable="subscriptionHistory">
		<cfinvoke component="#application.objsubscription#" method="getsubscription_record" subscriptiondsn="#client.siteurl#" subscriptionid="#url.s#" returnvariable="subscriptionRecord">
		<cfinvoke component="#application.objsubscription#" method="getsubscriptionactivations" subscriptiondsn="#client.siteurl#" subscriptionid="#url.s#" returnvariable="subscriptionActivations">
		<cfinvoke method="getSubscriptionInfo" subscriptiondsn="#client.siteurl#" subscriptionid="#url.s#" returnvariable="subscriptioninfo">
		<h1>
			Plan: <small>#subscriptionInfo.itemname#</small> <br />
			Subscriber: <small>#subscriptionInfo.firstname# #subscriptionInfo.lastname#</small>
		</h1>
		<cfif subscriptionHistory.recordcount GT 0>
			<table class="datagrid" width="910">
				<tr class="titlebar">
					<th>Renewed By</th>
					<th>Date Renewed</th>
					<th>Next Renewal Date</th>
				</tr>
				<cfloop query="subscriptionhistory">
					<cfif currentRow MOD 2 EQ 0><tr class="alt"><cfelse><tr></cfif>
						<cfset date_renewed=application.objtimedateconversion.convertDate(daterenewed,'mm/dd/yyyy')>
						<cfset time_renewed=application.objtimedateconversion.convertTime(daterenewed,'hh:mmtt')>
						<cfset renewal_date=application.objtimedateconversion.convertDate(renewaldate,'mm/dd/yyyy')>
						<cfset renewal_time=application.objtimedateconversion.convertTime(renewaldate,'hh:mmtt')>
						<td>#nameid#</td>
				  		<td>#date_renewed# #time_renewed#</td>
						<td>#renewal_date# #renewal_time#</td>
					</tr>
				</cfloop>
			</table>
			<br /><br />
		</cfif>

		<cfif subscriptionRecord.recordcount GT 0>
			<table class="datagrid" width="910">
				<tr class="titlebar">
					<th>Cancelled/Revoked</th>
					<th>Cancelled/Revoed By</th>
					<th>Date</th>
				</tr>
				<cfloop query="subscriptionRecord">
					<cfif currentRow MOD 2 EQ 0><tr class="alt"><cfelse><tr></cfif>
						<td><cfif cancelled EQ 1>Cancelled<cfelse>Restored</cfif></td>
						<td>#nameid#</td>
						<cfset dateRecorded=application.objtimedateconversion.convertDate(recordedon,'mm/dd/yyyy')>
						<cfset timeRecorded=application.objtimedateconversion.convertTime(recordedon,'hh:mmtt')>
						<td>#dateRecorded# #timeRecorded#</td>
					</tr>
				</cfloop>
			</table>
			<br /><br />
		</cfif>
		
		<cfif subscriptionActivations.recordcount GT 0>
			<table class="datagrid" width="910">
				<tr class="titlebar">
					<th>Activation ID</th>
					<th>Activated/Deactivated</th>
					<th>Date</th>
				</tr>
				<cfloop query="subscriptionActivations">
					<cfif currentRow MOD 2 EQ 0><tr class="alt"><cfelse><tr></cfif>
						<cfset activationDate=application.objtimedateconversion.convertDate(timedate,'mm/dd/yyyy')>
						<cfset activationTime=application.objtimedateconversion.convertTime(timedate,'hh:mmtt')>
						<td>#activationid#</td>
						<td><cfif activated EQ 1>Activated<cfelse>Deactivated</cfif></td>
						<td>#activationDate# #activationTime#</td>
					</tr>
				</cfloop>
			</table>
			<br /><br />
		</cfif>
	</cfif>
</cfoutput>

<!--- add this to subscription.cfc --->
<cffunction name="getSubscriptionInfo" access="public" returntype="query" hint="I get information about a subscription">
	<cfargument name="subscriptiondsn" required="true" type="string" hint="Database Name">
	<cfargument name="subscriptionid" required="true" type="string" hint="Id of the subscription">
	<cfset var get=0>
	<cfquery name="get" datasource="#arguments.subscriptiondsn#">
		SELECT 
			IDPOOL.ITEMNAME,
			SUBSCRIBED.NAMEID,
			NAME.FIRSTNAME,
			NAME.LASTNAME
		FROM IDPOOL,SUBSCRIBED,NAME
		WHERE SUBSCRIBED.SUBSCRIPTIONID=<cfqueryparam value="#arguments.subscriptionid#">
		AND SUBSCRIBED.NAMEID=NAME.NAMEID
		AND IDPOOL.ID=SUBSCRIBED.ID
	</cfquery>
	<cfreturn get> 
</cffunction>