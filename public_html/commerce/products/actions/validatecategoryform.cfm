<cfobject component="formvalidation" name="objformvalidation">
<cfset objformvalidation.set_rules('category','Category','required,max_len[64]')>
<cfif objformvalidation.isValidform()>
	<cfset args=StructNew()>
	<cfset args.productdsn=client.siteurl>
	<cfset args.category=form.category>
	<cfif Trim(form.category) NEQ ''>
		<cfset args.categoryid=form.categoryid>
	</cfif>
	<cfinvoke component="#application.objproduct#" method="checkCategory" argumentcollection="#args#" returnvariable="categoryIsAlreadyThere">
	<cfif categoryIsAlreadyThere>
		<cfset objformvalidation.addError('There #form.category# already exists')>
	</cfif>
</cfif>
<cfinclude template="/actions/checkforerrorsinform.cfm">