<cfobject component="formvalidation" name="objformvalidation">
<cfset objformvalidation.set_rules('category','Album Name','required,max_len[32]')>
<cfinclude template="/actions/checkforerrorsinform.cfm">