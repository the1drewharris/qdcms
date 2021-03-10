<cfobject component="formvalidation" name="objformvalidation">
<cfset objformvalidation.set_rules('name','Template Name','required,max_len[64]')>
<cfset objformvalidation.set_rules('template','HTML Template','required')>
<cfinclude template="/actions/checkforerrorsinform.cfm">