<cfobject component="formvalidation" name="objformvalidation">
<cfinvoke component="#application.objqdsecurity#" method="getSectionsInProduct" productid="#application.productid#" returnvariable="sections">
<cfloop query="sections">
	<cfset objformvalidation.set_rules('s_#sectionid#','Sort Value for #section_name#','required,numeric,min_val[1],max_val[#recordcount#]')>
</cfloop>
<cfinclude template="/actions/checkforerrorsinform.cfm">