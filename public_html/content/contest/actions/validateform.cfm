<cfobject component="formvalidation" name="objformvalidation">
<cfset objformvalidation.set_rules('description','Name of the contest','required,max_len[128]')>
<cfif objformValidation.isValidForm()>
	<cfset thereAreNoErrorsInForm=TRUE>
<cfelse>
	<cfset client.message="Please correct the following errors">
	<cfset client.errorList=objformValidation.getListOfErrors()>
	<cfloop list="#form.fieldnames#" index="fieldname">
		<cfset session.formValues['#fieldname#']=form['#fieldname#']>
	</cfloop>
	<cfset thereAreNoErrorsInForm=FALSE>
</cfif>