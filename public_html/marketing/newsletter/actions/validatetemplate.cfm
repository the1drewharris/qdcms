<cfobject component="formvalidation" name="objformvalidation">
<cfset objformvalidation.set_rules('name','Template name','required')>
<cfset objformvalidation.set_rules('template','HTML Template','required')>
<cfif objformvalidation.isValidForm()>
	<cfset thereAreNoErrorsInForm=TRUE>
<cfelse>
	<cfset thereAreNoErrorsInForm=FALSE>
	<cfset client.message="Please correct the following errors">
	<cfset client.errorList=objformvalidation.getListOfErrors()>
	<cfloop list="#form.fieldnames#" index="fieldname">
		<cfset session.formValues['#fieldname#']=form['#fieldname#']>
	</cfloop>
</cfif>