<cfobject component="formvalidation" name="objformvalidation">
<cfinvoke component="#application.objqdsecurity#" method="getModulesInSection" sectionid="#form.sectionid#" returnvariable="modules">
<cfloop query="modules">
	<cfset objformvalidation.set_rules('m_#moduleid#','Sort Value for #module_name#','required,numeric,min_val[1],max_val[#recordcount#]')>
</cfloop>
<cfinclude template="/actions/checkforerrorsinform.cfm">