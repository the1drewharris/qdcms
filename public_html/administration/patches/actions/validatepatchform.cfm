<cfobject component="formvalidation" name="objformvalidation">
<cfset objformvalidation.set_rules('patchname','Name','required,max_len[64]')>
<cfset objformvalidation.set_rules('filename','File Name','required,max_len[64]')>
<cfset objformvalidation.set_rules('description','Description','required')>
<cfinclude template="/actions/checkforerrorsinform.cfm">