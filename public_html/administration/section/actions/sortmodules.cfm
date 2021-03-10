<cfinclude template="validatesortmodules.cfm">
<cfif thereAreNoErrorsInForm>
	<cfset sortvaluelist="">
	<cfset modulelist=valueList(modules.MODULEID)>
	<cfloop query="modules">
		<cfset sortvalue=Evaluate('form.m_#moduleid#')*10>
		<cfset sortvaluelist=listAppend(sortvaluelist,sortvalue)>
	</cfloop>
	<cftransaction>
		<cfinvoke component="#application.objqdsecurity#" method="sortModulesInSection" sectionid="#form.sectionid#" modulelist="#modulelist#" sortvaluelist="#sortvaluelist#">
	</cftransaction>
</cfif>
<cflocation url="#CGI.HTTP_REFERER#" addtoken="false">