<cfoutput>
	<cfinvoke component="#application.objqdsecurity#" method="getUsersRole" nameid="#form.nameid#" returnvariable="sitesWithpermission">
	<cftransaction>
		<cfloop query="sitesWithpermission">
			<cfif listfindnocase(Session.adminsites,siteid)>
				<cfset mysiteid=siteid>
				<cfset oldrole=roleid>
				<cfset newrole=Evaluate('form.site#siteid#roleid')>
				<cfif oldrole NEQ newrole>
					<cfinvoke component="#application.objqdsecurity#" method="assignRoletoUser" nameid="#form.nameid#" siteid="#siteid#" roleid="#newrole#">
				</cfif>
				<cfinvoke component="#application.objqdsecurity#" method="getmodulesinsite" siteid="#mysiteid#" returnvariable="modulesinsite">
				<cfinvoke component="#application.objqdsecurity#" method="getModulesForUser" nameid="#form.nameid#" siteid="#mysiteid#" returnvariable="modulesforuser">
				<cfset modulesSelected="">
				<cfloop query="modulesinsite">
					<cfif isDefined('form.site#mysiteid#_module#moduleid#')>
						<cfset modulesSelected=listAppend(modulesSelected,moduleid)>
					</cfif>
				</cfloop>
				<cfset modulediff=application.objtextconversion.getListDifference(modulesSelected,modulesforuser)>
				<cfloop list="#modulediff.a#" index="moduletoadd">
					<cfinvoke component="#application.objqdsecurity#" method="addModulesToUser" siteid="#mysiteid#" nameid="#form.nameid#" moduleid="#moduletoadd#">
				</cfloop>
				<cfloop list="#modulediff.b#" index="moduletoremove">
					<cfinvoke component="#application.objqdsecurity#" method="removeModulesForUser" siteid="#mysiteid#" nameid="#form.nameid#" moduleid="#moduletoremove#">
				</cfloop>
			</cfif>
		</cfloop>
	</cftransaction>
</cfoutput>
<cfset client.message="User permissions has been updated">
<cflocation url="/cms/administration/users/editpermission?userid=#form.nameid#" addtoken="false">