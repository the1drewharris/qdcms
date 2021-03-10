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
<cfinvoke component="#application.objnewsletter#" method="getPeopleNewsletterSentTo" ds="#client.siteurl#" newsletterid="#url.newsletterid#" sortorder="#sortorder#" returnvariable="report">
<cfoutput>
	<table class="datagrid" width="910">
		<tr class="titlebar">
		<th>SN</th>
		<th>ID</th>
		<th>First Name</th>
		<th>Last Name</th>
		<th>Email</th>
		<th>Viewed On</th>
		</tr>
		<cfloop query="report">
		<tr>
			<td>#currentrow#</td>
			<td>#nameid#</td>
			<td>#firstname#</td>
			<td>#lastname#</td>
			<td><a href="mailto:#senttoemail#">#senttoemail#</a></td>
			<td><cfif len(timeviewed) EQ 16>#Application.objtimedateconversion.convertDate(timeviewed,"mmm dd yyyy")#<cfelse>#TIMEVIEWED#</cfif></td>
		</tr>
		</cfloop>
	</table>
<br /><br />
<a href="/cms/marketing/newsletter/downloadreport/?newsletterid=#url.newsletterid#&s=#url.s#">Download Excel File</a>
</cfoutput>