<cfoutput>
	<cfinvoke component="#application.objqdsecurity#" method="getQdModules" returnvariable="allModules">
	<cfloop query="allModules">
		<cfif application.objtextconversion.setformValue('module#moduleid#') NEQ "">
			<cfset moduleIsInSite=TRUE>
		<cfelse>
			<cfset moduleIsInSite=FALSE>
		</cfif>
		<input name="module#moduleid#" type="checkbox" value="#moduleid#" <cfif moduleIsInSite>Checked</cfif>>#module_name# <br />
	</cfloop>
</cfoutput>