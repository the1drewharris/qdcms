<cfobject component="formValidation" name="objformValidation">
<cfset objformValidation.set_rules('securityrole','Security Role','required')>
<cfset objformValidation.set_rules('description','description','required')>
<cfif objformValidation.isValidform()>
	<cfinvoke component="#application.objqdsecurity#" method="getQdModules" returnvariable="allModules">
	<cftransaction>
		<cfinvoke component="#application.objqdsecurity#" method="removeModulefromSecurityRole" roleid="#form.roleid#">
		<cfinvoke component="#application.objqdsecurity#" method="updateSecrurityRole" argumentcollection="#form#">
		<cfloop query="allmodules">
			<cfif isDefined('form.module#moduleid#')>
				<cfinvoke component="#application.objqdsecurity#" method="addModulesToSecurityRoles" roleid="#form.roleid#" moduleid="#moduleid#">
			</cfif>
		</cfloop>
	</cftransaction>
	<cfset client.message="The security role was updated">
<cfelse>
	<cfset client.message="Please correct the following errors">
	<cfset client.errorList=objformValidation.getListofErrors()>
	<cfloop list="#form.fieldnames#" index="fieldname">
		<cfset session.formValues['#fieldname#']=form['#fieldname#']>
	</cfloop>
	<cflocation url="#CGI.HTTP_REFERER#" addtoken="false">
</cfif>
<cflocation url="/cms/administration/roles" addtoken="false">