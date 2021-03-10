<cfobject component="formvalidation" name="objformvalidation">
<cfset objformvalidation.set_rules('question','Survey Question','required,max_len[256]')>
<cfinclude template="/actions/checkforerrorsinform.cfm">