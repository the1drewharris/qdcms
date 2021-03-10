<cfoutput>
	<cfparam name="url.s" default="0">
	<cfinvoke component="#application.objqdsecurity#" method="getModulesInSection" sectionid="#url.s#" returnvariable="mymodules">
	<cfif mymodules.recordcount GT 0>
	<h1>Sort Modules</h1>
	<form id="form" method="post" action="/cms/#url.section#/#url.module#/actionsortmodules">
		<input type="hidden" name="sectionid" value="#url.s#">
		<table class="datagrid" id="managePagesTable">
			<tr class="titlebar">
				<th>Sort Value</th>
				<th>Module</th>
			</tr>
			<cfloop query="mymodules">
				<cfif currentRow MOD 2 EQ 0>
					<tr class="alt">
				<cfelse>
					<tr>
				</cfif>
				<td><input type="text" name="m_#moduleid#" value="#currentrow#" size="1"></td>
		  		<td>#module_name#</td>
				</tr>
			</cfloop>
			<tr>
				<td colspan="2">
					<input name="submit" type="submit" value="Submit">
				</td>
			</tr>
		</table>
	</form>
	<cfelse>
		<div class="quicknote">
			<h1>There are no modules for this section</h1>
		</div>
	</cfif>
</cfoutput>