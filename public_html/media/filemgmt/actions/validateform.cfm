<cfobject component="formvalidation" name="objformvalidation">
<cfset objformvalidation.set_rules('displayname','Display Name','required,max_len[64]')>
<cfset objformvalidation.set_rules('file','File','required,max_len[256]')>
<cfset objformvalidation.set_rules('sortorder','Sort Order','required,Numeric,max_value[10000]')>
<cfif objformvalidation.isValidform()>
	<cfset thereAreNoErrorsInForm=TRUE>
<cfelse>
	<cfset thereAreNoErrorsInForm=FALSE>
	<cfset client.message="Please correct the following errors">
	<cfset client.errorList=objformvalidation.getListOfErrors()>
	<cfloop list="#form.fieldnames#" index="fieldname">
		<cfset session.formvalues['#fieldname#']=form['#fieldname#']>
	</cfloop>
</cfif>