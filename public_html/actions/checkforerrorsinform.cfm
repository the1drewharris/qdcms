<cfif objformvalidation.isValidform()>
	<cfset thereAreNoErrorsInForm=TRUE>
<cfelse>
	<cfset thereAreNoErrorsInForm=FALSE>
	<cfset client.message="Please correct the following errors">
	<cfset client.errorList=objformvalidation.getListofErrors()>
	<cfloop list="#form.fieldnames#" index="fieldname">
		<cfset session.formValues['#fieldname#']=form['#fieldname#']>
	</cfloop>
</cfif>