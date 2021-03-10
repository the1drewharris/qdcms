<cfset thereIsError=TRUE>
<cfobject component="formvalidation" name="objformvalidation">
<cfset objformvalidation.set_rules('modulename','Module Name','required,min_len[3],max_len[32]')>
<cfset objformvalidation.set_rules('caption','Caption','required,min_len[3],max_len[32]')>
<cfset objformvalidation.set_rules('description','Description','required')>
<cfif objformvalidation.isValidform()>
	<cftransaction>
		<cfinvoke component="#application.objqdsecurity#" method="removeModuleFromSection" moduleid="#form.moduleid#">
		<cfinvoke component="#application.objqdsecurity#" method="updateQdModule" argumentcollection="#form#">
		<cfinvoke component="#application.objqdsecurity#" method="getQdSections" returnvariable="allsections">
		<cfloop query="allsections">
			<cfif isDefined('form.section#sectionid#')>
				<cfinvoke component="#application.objqdsecurity#" method="addModulesToSections" moduleid="#form.moduleid#" sectionid="#sectionid#">
			</cfif>
		</cfloop>
	</cftransaction>
	<cfset thereIsError=FALSE>
	<cflocation url="/cms/administration/module" addtoken="false">
<cfelse>
	<cfset client.errorList=objformValidation.getListofErrors()>
</cfif>

<cfif thereIsError>
	<cfif listlen(client.errorList) GT 1>
		<cfset client.message="Please correct the following errors">
	<cfelse>
		<cfset client.message="Please correct the following error">
	</cfif>
	
	<cfloop list="#form.fieldnames#" index="fieldname">
		<cfset session.formValues['#fieldname#']=form['#fieldname#']>
	</cfloop>
	<cflocation url="/cms/administration/module/editmodule/?moduleid=#form.moduleid#" addtoken="false">
</cfif>