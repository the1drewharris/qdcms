<cfoutput>
	<cfinvoke component="#application.objqdsecurity#" method="getSectionsInProduct" productid="#application.productid#" returnvariable="mysections">
	<cfif mysections.recordcount GT 0>
		<h1>Sort Sections</h1>
		<table class="datagrid" id="managePagesTable">
			<tr class="titlebar">
				<th>Sort Value</th>
				<th>Section</th>
				<th>Description</th>
			</tr>
			<form id="form" method="post" action="/cms/#url.section#/#url.module#/actionsortsections">
			<cfloop query="mysections">
				<cfif currentRow MOD 2 EQ 0>
					<tr class="alt">
				<cfelse>
					<tr>
				</cfif>
				<td><input type="text" name="s_#sectionid#" value="#currentRow#" size="1"></td>
				<td>#section_name#</td>
		  		<td>#description#</td>
				</tr>
			</cfloop>
			<tr>
				<td colspan="3">
					<input type="submit" name="submit" value="Submit">
				</td>
			</tr>
			</form>
		</table>
	<cfelse>
		<div class="quicknote">
			Some Message Here
		</div>
	</cfif>
</cfoutput>