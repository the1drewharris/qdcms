<cfparam name="url.newsletterid" default="0">
<cfif url.newsletterid EQ 0>
	<cfabort>
</cfif>

<cfparam name="s" default="1">
<cfif s EQ 1>
<cfset sortorder="SENTTOEMAIL">
<cfelseif s EQ 2>
<cfset sortorder="NAME.NAMEID">
<cfelseif s EQ 3>
<cfset sortorder="TIMEVIEWED">
<cfelseif s EQ 4>
<cfset sortorder="TIMEVIEWED">
<cfelseif s EQ 5>
<cfset sortorder="TIMEVIEWED">
</cfif>

<cfinvoke component="#Application.objnewsletter#" method="getPeopleNewsletterSentTo" ds="#client.siteurl#" newsletterid="#url.newsletterid#" sortorder="#sortorder#" returnvariable="report">
<cfsetting showDebugOutput="no">
<cfsavecontent variable="detailreport">
<cfoutput>
	<table>
		<tr>
		<th>ID</th>
		<th>First Name</th>
		<th>Last Name</th>
		<th>Email</th>
		<th>Viewed On</th>
		</tr>
		<cfloop query="report">
		<tr>
			<td>#nameid#</td>
			<td>#firstname#</td>
			<td>#lastname#</td>
			<td>#senttoemail#</td>
			<td><cfif timeviewed NEQ "NOT VIEWED">#Application.mytime.convertDate(timeviewed,"mmm dd yyyy")#<cfelse>Not Viewed</cfif></td>
		</tr>
		</cfloop>
	</table>
</cfoutput>
</cfsavecontent>

<cfsetting enablecfoutputonly="Yes">
<cfheader name="Content-Disposition" value="inline; filename=report.xls">
<cfcontent type="application/vnd.msexcel" >
<cfoutput>#detailreport#</cfoutput>

	