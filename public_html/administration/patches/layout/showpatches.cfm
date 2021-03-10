<cfoutput>
	<cfinvoke component="#application.objpatch#" method="getPatches" returnvariable="allpatches">
	<table class="datagrid" id="managePagesTable">
		<tr class="titlebar">
			<th>Patch Name</th>
			<th>File</th>
			<th>Added On</th>
			<th>Last Updated</th>
			<th>Report</th>
			<th>Status</th>
		</tr>
		<cfloop query="allpatches">
			<cfif currentRow MOD 2 EQ 0>
				<tr class="alt">
			<cfelse>
				<tr>
			</cfif>
			<td>
				<a href="/cms/administration/patches/editpatch/?patchid=#patchid#" class="name">#patchname#</a>		
			</td>
			<td>#filename#</td>
	  		<td>#application.objtimedateconversion.convertDate(patchaddedon, "yyyy-mm-dd")#</td>
			<td>#application.objtimedateconversion.convertDate(lastupdatedon, "yyyy-mm-dd")#</td>
			<td><a href="/cms/administration/patches/patchreport/?patchid=#patchid#">View</a></td>
			<td><cfif status EQ 1>Active<cfelse>Inactive</cfif></td>
		</cfloop>
	</table>
</cfoutput>