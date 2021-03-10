<cfset thispatchname=application.objpatch.getPatchName(url.patchid)>
<cfoutput>
	<cfif thispatchname NEQ "">
		<cfinvoke component="#application.objpatch#" method="getPatchReport" patchid="#url.patchid#" returnvariable="report">
		<cfif report.recordcount GT 0>
			<h1>#thispatchname# : Report</h1>
			<table class="datagrid" id="managePagesTable">
			<tr class="titlebar">
				<th>Site</th>
				<th>Applied Date</th>
			</tr>
			<cfloop query="report">
				<cfif currentRow MOD 2 EQ 0>
					<tr class="alt">
				<cfelse>
					<tr>
				</cfif>
				<td>#siteurl#</td>
		  		<td>#application.objtimedateconversion.convertdate(PATCHAPPLIEDON,'yyyy-mm-dd')#</td>
			</cfloop>
		</table>
		<cfelse>
			Patch #thispatchname# has not been applied to any site
		</cfif>
	<cfelse>
		<cfset client.message="Such patch does not exist">
		<cflocation url="/cms/administration/patches/showpatches" addtoken="false">
	</cfif>
</cfoutput>