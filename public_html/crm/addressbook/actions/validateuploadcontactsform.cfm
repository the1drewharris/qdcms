<cfobject component="formvalidation" name="objformvalidation">
<cfif Trim(form.filedata) EQ ''>
	<cfset objformvalidation.addError('You have to select a file to upload')>
</cfif>
<cfif NOT IsDefined('grouplist')>
	<cfset objformvalidation.addError('You have to select at least one group')>
</cfif>
<cfinclude template="/actions/checkforerrorsinform.cfm">