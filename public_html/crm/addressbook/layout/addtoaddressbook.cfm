<!--- <cfif Trim(cgi.http_referer) EQ 'http://#application.dsn#/cms/crm/addressbook/uploadcontacts'> --->
	<cfinclude template="../includes/listofabcolumns.cfm">
	<cfset noofdbcolumns=Arraylen(columndb)>
	<cfset nooffilecolumns=Arraylen(session.columnxl)>
	
	<cfoutput>
		<table class="datagrid" width="910">
			<tr class="titlebar">
				<th>Database Fields</th>
				<th>Selected DB Fields</th>
				<th>Selected File Fields</th>
				<th>File Fields</th>
			</tr>
			<tr>
				<td valign="top">
					<ol id="dbfields">
					<cfloop from="1" to="#noofdbcolumns#" index="i">
						<li id="columndb_#i#" class="allcolumns">#columndb[i]#</li>
					</cfloop>
					</ol>
				</td>
				<td valign="top">
					<ol id="chosendbfields" class="empty-list">
					</ol>
				</td>
				<td valign="top">
					<ol id="chosenxlfields" class="empty-list">
					</ol>
				</td>
				<td valign="top">
					<ol id="xlfields">
					<cfloop from="1" to="#nooffilecolumns#" index="j">
						<li id="columnxl_#j#" class="allcolumns">#session.columnxl[j]#</li>
					</cfloop>
					</ol>
				</td>
			</tr>
			<tr>
				<td colspan="4">
					<a href="##" id="submit">SUBMIT</a>
				</td>
			</tr>
		</table>
	</cfoutput>
<!---
<cfelse>
	<cflocation url="/cms/#url.section#/#url.module#/uploadcontacts" addtoken="false">
	--->
<!--- </cfif> --->