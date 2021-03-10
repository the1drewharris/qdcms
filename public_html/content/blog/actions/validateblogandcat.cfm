<cfobject component="formvalidation" name="objformvalidation">
<cfset objformvalidation.set_rules('name','Name','required,max_len[64]')>
<cfif objformValidation.isValidform()>
	<cfset formHasNoErrors=TRUE>
<cfelse>
	<cfset formHasNoErrors=FALSE>
	<cfset client.message="Please correct the following errors">
	<cfset client.errorList=objformValidation.getListOfErrors()>
	<cfloop list="#form.fieldnames#" index="fieldname">
		<cfset session.formValues['#fieldname#']=form['#fieldname#']>
	</cfloop>
</cfif>