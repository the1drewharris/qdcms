<!--- Security required for this page --->

<cfset thereIsError=TRUE>
<cfobject component="formvalidation" name="objformvalidation">
<cfset objformvalidation.set_rules('sectionname','Section Name','required,min_len[3],max_len[32]')>
<cfset objformvalidation.set_rules('description','Description','required')>
<cfif objformvalidation.isValidform()>
	<cftransaction>
		<cfinvoke component="#application.objqdsecurity#" method="removeSectionFromProducts" sectionid="#form.sectionid#">
		<cfinvoke component="#application.objqdsecurity#" method="updateQdSection" argumentcollection="#form#">
		<cfinvoke component="#application.objqdsecurity#" method="getQdProducts" returnvariable="allproducts">
		<cfloop query="allproducts">
			<cfif isDefined('form.product#productid#')>
				<cfinvoke component="#application.objqdsecurity#" method="addSectionToProduct" sectionid="#form.sectionid#" productid="#productid#">
			</cfif>
		</cfloop>
	</cftransaction>
	<cfset thereIsError=FALSE>
	<cfinvoke component="#application.objqdsecurity#" method="getQdSections" returnvariable="session.allsections">
	<cflocation url="/cms/administration/section" addtoken="false">
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
	<cflocation url="/cms/administration/section/editsection/?sectionid=#form.sectionid#" addtoken="false">
</cfif>