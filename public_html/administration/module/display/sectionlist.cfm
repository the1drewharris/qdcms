<cfoutput>
	<cfinvoke component="#application.objqdsecurity#" method="getQdSections" returnvariable="allsections">
	<cfloop query="allsections">
		<cfif application.objtextconversion.setformValue('section#sectionid#') NEQ "">
			<cfset moduleIsInSection=TRUE>
		<cfelse>
			<cfset moduleIsInSection=FALSE>
		</cfif>
		<input name="section#sectionid#" type="checkbox" value="#sectionid#" <cfif moduleIsInSection>Checked</cfif> />#section_name# <br />
	</cfloop>
</cfoutput>