<cfobject component="formvalidation" name="objformvalidation">
<cfset objformvalidation.set_rules('servername','Server Name','required,max_len[320]')>
<cfif objformvalidation.isValidForm()>
	<cfset args=StructNew()>
	<cfset args.ds=client.siteurl>
	<cfset args.servername=form.servername>
	<cfif url.action EQ 'actioneditemailserver'>
		<cfset args.serverid=form.serverid>
	</cfif>
	<cfinvoke component="#application.objnewsletter#" method="checkEmailServer" argumentcollection="#args#" returnvariable="EmailServerIsAlreadyThere">
	<cfif emailServerIsAlreadyThere>
		<cfset objformvalidation.addError('The email server #form.servername# is already in the database')>
	</cfif>
</cfif>
<cfset objformvalidation.set_rules('port','Port','required,max_len[6]')>
<!---
<cfset objformvalidation.set_rules('username','Username','required,max_len[32]')>
<cfset objformvalidation.set_rules('password','Password','required,max_len[32]')>
--->
<cfinclude template="/actions/checkforerrorsinform.cfm">