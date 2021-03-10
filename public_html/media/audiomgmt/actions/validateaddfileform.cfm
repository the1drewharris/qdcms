<cfobject component="formvalidation" name="objformvalidation">
<cfset objformvalidation.set_rules('title','Title','required,max_len[64]')>
<cfset objformvalidation.set_rules('file','File','required')>
<cfset objformvalidation.set_rules('description','Description','required')>
<cfinclude template="/actions/checkforerrorsinform.cfm">