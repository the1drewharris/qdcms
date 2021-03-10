<cfinvoke component="#application.objpatch#" method="getSiteReport" siteid="#client.siteid#" returnvariable="report">
<cfif report.recordcount GT 0>
	<cfoutput>
		<table class="datagrid" id="managePagesTable">
			<tr class="titlebar">
				<th>Patch Name</th>
				<th>File Name</th>
				<th>Patch Applied On</th>
			</tr>
			<cfloop query="report">
				<cfif currentRow MOD 2 EQ 0>
					<tr class="alt">
				<cfelse>
					<tr>
				</cfif>
				<td>#patchname#</td>
				<td>#filename#</td>
		  		<td>#application.objtimedateconversion.convertdate(patchappliedon,'yyyy-mm-dd')#</td>
			</cfloop>
		</table>
	</cfoutput>
<cfelse>
	No patches has been applied to this site
</cfif>