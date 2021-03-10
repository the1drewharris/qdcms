<cfoutput>
	<cfinvoke component="#application.objqdsecurity#" method="getQdModules" returnvariable="allModules">
	<cfloop query="allModules">
		<cfif application.objtextconversion.setformValue('module#moduleid#') NEQ "">
			<cfset moduleIsInRole=TRUE>
		<cfelse>
			<cfset moduleIsInRole=FALSE>
		</cfif>
		<input name="module#moduleid#" type="checkbox" value="#moduleid#" <cfif moduleIsInRole>Checked</cfif>>#module_name# <br />
	</cfloop>
</cfoutput>