<cfoutput>
	<cfset clickPercentage = .9>
	<cfset impressionPercentage = .9>
	<cfset daysToExpire = 5>
	
	<cfparam name="url.advertiserID" default="8335">
	<cfinvoke component="#application.objadmanagement#" method="getBannerAd" returnvariable="bannerad" admanagementdsn="#client.siteurl#" advertiser_nameid="#url.advertiserID#" sortorder="bannerad.adname">
	<cfinvoke component="#application.abCFC#" method="getContactInfo" contactdsn="#client.siteurl#" nameid="#url.advertiserID#" returnvariable="contactInfo">
	<h3>Advertiser: #contactInfo.Company#</h3>
	<table class="datagrid admanagement">
	<tr class="titlebar">
		<th class="status">Status</th>
		<th class="name">Name</th>
		<th>Clicks</th>
		<th>Impressions</th>
		<th>Time</th>
		<th>Report</th>
		<th>Delete</th>
	</tr>
	<cfloop query="bannerad">
		<cfset dateClass = "">
		<cfset clickClass = "">
		<cfset impressionClass = "">
		<cfset clickPercent = 0>
		<cfset impressionPercent = 0>
		<cfinvoke component="#application.objadmanagement#" method="getCurrent" returnVariable="getCurrent" admanagementdsn="#client.siteurl#" adid="#adid#">
	
		<cfset daysUntilExpiration = dateDiff('d',now(),application.objtimedateconversion.convertDate(enddate))>
	
		<cfif maxclick NEQ 0 AND isNumeric(getCurrent.noofclicks)>
			<cfset clickPercent = getCurrent.noofclicks/maxclick>
		</cfif>
		<cfif maximpression NEQ 0 AND isNumeric(getCurrent.noofimpressions)>
			<cfset impressionPercent = getCurrent.noofimpressions/maximpression>
		</cfif>
		<tr>
			<td class="status">
				<cfif active EQ 0>
					<cfset inactiveFlag = 1>
					<cfif daysUntilExpiration LTE 0 AND check_date NEQ 0>
						<div class="expired">Expired: Date</div>
						<cfset dateClass = "expired">
						<cfset inactiveFlag = 0>
					</cfif>
					<cfif clickPercent GTE 1>
						<div class="expired">Expired: Clicks</div>
						<cfset clickClass = "expired">
						<cfset inactiveFlag = 0>
					</cfif>
					<cfif impressionPercent GTE 1>
						<div class="expired">Expired: Impressions</div>
						<cfset impressionClass = "expired">
						<cfset inactiveFlag = 0>
					</cfif>
					<cfif inactiveFlag EQ 1>
						<div class="expired">Inactive</div>
					</cfif>
				<cfelse>
					<cfset activeFlag = 1>
					<cfif maxclick NEQ 0 AND getCurrent.noofclicks NEQ 0>
						<cfif (daysUntilExpiration LTE daysToExpire AND daysUntilExpiration GT 0) AND check_date EQ 1>
							<div class="warning">Expires in #daysUntilExpiration# days</div>
							<cfset dateClass = "warning">
							<cfset activeFlag = 0>
						</cfif>
						<cfif clickPercent GTE clickPercentage>
							<div class="warning">#(DecimalFormat(clickPercent)*100)#% of Clicks</div>
							<cfset clickClass = "warning">
							<cfset activeFlag = 0>
						</cfif>
						<cfif impressionPercent GTE impressionPercentage>
							<div class="warning">#(DecimalFormat(impressionPercent)*100)#% of Impressions</div>
							<cfset impressionClass = "warning">
							<cfset activeFlag = 0>
						</cfif>
					</cfif>
					<cfif activeFlag EQ 1>
						<cfif startdate LTE application.objtimedateconversion.createtimedate()>
							<div class="active">Active</div>
						<cfelse>
							<div class="future">Future</div>
						</cfif>
					</cfif>
				</cfif>
			</td>
			<td class="name"><a href="/cms/marketing/admanagement/editadvertisement/?adid=#adid#">#adname#</a><br />
			<span class="small"><strong>Zone:</strong> <a href="/cms/marketing/admanagement/zonedashboard/?zoneid=#zoneid#">#description#</a></span></td>
			<td><div class="#clickClass#">#NumberFormat(getcurrent.noofclicks)# of <cfif maxclick EQ 0>Unlimited<cfelse>#NumberFormat(maxclick)#</cfif></div></td>
			<td><div class="#impressionClass#">#NumberFormat(getcurrent.noofimpressions)# of <cfif maximpression EQ 0>Unlimited<cfelse>#NumberFormat(maximpression)#</cfif></div></td>
			<td><div class="#dateClass#">#application.objtimedateconversion.convertDate(startdate,"m/d/yy")# #application.objtimedateconversion.convertTime(startdate,"hh:mmtt")# &mdash; #application.objtimedateconversion.convertDate(enddate,"m/d/yy")#</div></td>
			<td><a href="/cms/marketing/admanagement/showimpressions/?adid=#adid#">Show</a></td>
			<td align="center">
				<a href="/cms/marketing/admanagement/deletead/?adid=#adid#"><img src="/marketing/admanagement/images/delete.png"></a>
			</td>
		</tr>
	</cfloop>
	</table>
</cfoutput>