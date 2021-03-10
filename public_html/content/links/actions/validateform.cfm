<cfobject component="formvalidation" name="objformvalidation">
<cfset objformvalidation.set_rules('name','Link name','required,max_len[64]')>
<cfset objformvalidation.set_rules('href','HREF','required,max_len[256]')>
<cfif objformvalidation.isValidform()>
	<cfset thereAreNoErrorsInForm=TRUE>
<cfelse>
	<cfset thereAreNoErrorsInForm=FALSE>
	<cfset client.message="Please correct the following errors">
	<cfset client.errorList=objformvalidation.getListOfErrors()>
	<cfloop list="#form.fieldnames#" index="fieldname">
		<cfset session.formValues['#fieldname#']=form['#fieldname#']>
	</cfloop>
</cfif>