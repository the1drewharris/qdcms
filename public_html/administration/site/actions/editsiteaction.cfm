<cfinclude template="siteformvalidator.cfm">
<cfif thereAreNoErrorsInForm>
	<cfinvoke component="#application.objqdsecurity#" method="getQdModules" returnvariable="allModules">
	<cftransaction>
		<cfinvoke component="#application.objsite#" method="updatesite" argumentcollection="#form#">
		<cfif client.roleid gt 4>
		<cfinvoke component="#application.objqdsecurity#" method="removeModuleFromSite" siteid="#form.siteid#">
		<cfloop query="allmodules">
			<cfif isDefined('form.module#moduleid#')>
				<cfinvoke component="#application.objqdsecurity#" method="addModulesToSite" siteid="#form.siteid#" moduleid="#moduleid#">
			</cfif>
		</cfloop>
		</cfif>
	</cftransaction>
	<cflocation url="/cms/#url.section#/#url.module#/showsites" addtoken="false">
<cfelse>
	<cflocation url="#CGI.HTTP_REFERER#" addtoken="false">
</cfif>
