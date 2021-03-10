<cfparam name="url.e" default="0">
<cfset args.haudsn=client.siteurl>
<cfset args.eventid=url.e>
<cfset eventname=application.objevent.getEventName(client.siteurl,args.eventid)>
<cfinvoke component="#application.objhau#" method="getreport" argumentcollection="#args#" returnvariable="report">
<cfif report.recordcount GT 0>
	<cfoutput>
		<cfchart format="jpg" chartheight="400" chartwidth="910" showxgridlines="true" showygridlines="true" title="Heard About Us Report for #eventname#">
			<cfchartseries type="bar" itemcolumn="About Us" valuecolumn="No Of People" >
				<cfloop query="report">
					<cfchartdata item="#aboutus#" value="#noofpeople#" >
				</cfloop>
			</cfchartseries>
		</cfchart>
		<br /><br />
		<table class="datagrid" id="managePagesTable">
			<tr class="titlebar">
				<th>About Us</th>
				<th>No of People</th>
			</tr>
			<cfloop query="report">
				<cfif currentRow MOD 2 EQ 0>
					<tr class="alt">
				<cfelse>
					<tr>
				</cfif>
					<td>#aboutus#</td>
					<td>#noofpeople#</td>
				</tr>
			</cfloop>
		</table>
	</cfoutput>
<cfelse>
	No data associated with records
</cfif>