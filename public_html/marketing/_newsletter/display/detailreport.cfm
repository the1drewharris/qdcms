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
<!--- <cfif client.siteurl EQ 'tulsa.jbfsale.com'>
	<cfset args=StructNew()>
	<cfset args.contactdsn=client.siteurl>
	<cfset args.groupid="2010071213435857">
	<cfloop query="report">
		<cfset args.nameid=nameid>
		<cfinvoke component="#application.abCFC#" method="addContactToGroup" argumentcollection="#args#">
	</cfloop>
</cfif> --->
<cfoutput>
	<table class="datagrid" width="910">
		<tr class="titlebar">
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
			<td><a href="mailto:#senttoemail#">#senttoemail#</a></td>
			<td><cfif len(timeviewed) EQ 16>#Application.mytime.convertDate(timeviewed,"mmm dd yyyy")#<cfelse>#TIMEVIEWED#</cfif></td>
		</tr>
		</cfloop>
	</table>
<br /><br />
<a href="/cms/marketing/newsletter/downloadreport/?newsletterid=#url.newsletterid#&s=#url.s#">Download Excel File</a>
</cfoutput>