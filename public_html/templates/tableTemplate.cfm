<cfoutput>
	<cfinvoke component="" method="" argumentcollection="" returnvariable="">
	<cfif .recordcount GT 0>
		<table class="datagrid" id="managePagesTable">
			<tr class="titlebar">
				<th class="checkbox"><input id="selectAll" type="checkbox" /></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
			</tr>
			<cfloop query="queryname">
				<cfif currentRow MOD 2 EQ 0>
					<tr class="alt">
				<cfelse>
					<tr>
				</cfif>
				<td><input type="checkbox" id="modulename#idofthecolumn#" /></td>
				<td>
					<a href="/cms/#url.section#/#url.module#/editmodulename/?idname=#idofthecolumn#" class="name"></a>			
				</td>
				<td></td>
		  		<td></td>
				<td></td>
				<td></td>
				</tr>
			</cfloop>
		</table>
	<cfelse>
		<div class="quicknote">
			Some Message Here
		</div>
	</cfif>
</cfoutput>