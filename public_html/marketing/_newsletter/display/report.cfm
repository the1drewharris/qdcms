<cfparam name="url.newsletterid" default="0">
<cfoutput>
<cfif url.newsletterid NEQ 0>
<cfinvoke component="#application.objnewsletter#" method="getNoOfPeopleSentTo" ds="#client.siteurl#" newsletterid="#url.newsletterid#" returnvariable="result">
<cfinvoke component="#application.objnewsletter#" method="getViewCount" ds="#client.siteurl#" newsletterid="#url.newsletterid#" returnvariable="viewcount">
<div class="report">
	<h3>Summary of Report</h3>
	<table class="datagrid" width="910">
		<tr class="titlebar">
			<th>No of Emails Sent</th>
			<th>No of People Sent to</th>
			<th>No of People Viewed</th>
			<th>Not Viewed Yet</th>
		</tr>
		<tr>
			<td>#result.noofemails# (<a href="/cms/marketing/newsletter/detailreport/?newsletterid=#url.newsletterid#&s=1">Detail</a>)</td>
			<td>#result.noofpeople# (<a href="/cms/marketing/newsletter/detailreport/?newsletterid=#url.newsletterid#&s=2">Detail</a>)</td>
			<td>#viewcount# (<a href="/cms/marketing/newsletter/detailreport/?newsletterid=#url.newsletterid#&s=3">Detail</a>)</td>
			<td>#(result.noofemails-(viewcount))# (<a href="/cms/marketing/newsletter/detailreport/?newsletterid=#url.newsletterid#&s=5">Detail</a>)</td>
		</tr>
	</table> <br /><br />

	<div class="clear"></div>
	<h3>Graph of Views Per Day(Last 14 Days)</h3>
	<div class="view-per-day">
		<!--- put graph here. show for a month --->
		<cfinvoke component="#application.objnewsletter#" method="newsletterViewedPerDay" ds="#client.siteurl#" newsletterid="#url.newsletterid#" returnvariable="views">
		<cfset lastviewed= views['DATEVIEWED'][#views.recordcount#]>
		<cfset lastviewed="#lastviewed#00000000">
		<cfset lastviewed=Application.mytime.convertDate(lastviewed)>
		<cfchart 
			format = "jpg" 
			show3D="no" 
			tipStyle="mouseOver"
		    showborder="yes"
			chartWidth="910"
			xaxistitle="Date"
			yaxistitle="No of views"
			showXGridLines="yes"
			title="View by day">
			<cfchartseries type="bar">
				<cfloop from="1" to="#views.recordcount#" index="i">
					<cfoutput>
						<cfset tempDate = DateFormat(lastviewed - 14 + i,"mmm-dd")>
						<cfchartdata item="#tempDate#" value="0">
					</cfoutput>
				</cfloop>
				<cfloop query="views">
					<cfset date = "#DATEVIEWED#00000000">
					<cfchartdata item="#Application.mytime.convertDate(date,"mmm-dd")#" value="#VIEWPERDAY#">
				</cfloop>
			</cfchartseries>
		</cfchart>
	</div>
<cfelse>
	<cflocation url="/cms/marketing/newsletter/" addtoken="false">
</cfif>
</cfoutput>