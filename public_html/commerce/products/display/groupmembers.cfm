<cfparam name="url.id" default="0">
<cfinvoke component="#application.objproduct#" method="getGroupMembers" productdsn="#client.siteurl#" groupid="#url.id#" returnvariable="allmembers">
<cfif allmembers.recordcount GT 0>
	<cfoutput>
		<table class="datagrid" id="managePagesTable">
			<cfloop query="allmembers">
				<cfif currentRow MOD 2 EQ 0>
					<tr class="alt">
				<cfelse>
					<tr>
				</cfif>
				<td>#itemname#</td>
				</tr>
			</cfloop>
		</table>
	</cfoutput>
</cfif>