<cftransaction>
	<cfloop list="#url.moduleList#" index="moduleid">
		<cfinvoke component="#application.objqdsecurity#" method="removeModulefromSecurityRole" moduleid="#moduleid#">
		<cfinvoke component="#application.objqdsecurity#" method="removeModuleFromSite" moduleid="#moduleid#">
		<cfinvoke component="#application.objqdsecurity#" method="removeModuleFromSection" moduleid="#moduleid#">
		<cfinvoke component="#application.objqdsecurity#" method="removeModulesForUser" moduleid="#moduleid#">
		<cfinvoke component="#application.objqdsecurity#" method="deleteModule" moduleid="#moduleid#">
	</cfloop>
</cftransaction>
<cflocation url="/cms/administration/module" addtoken="false">