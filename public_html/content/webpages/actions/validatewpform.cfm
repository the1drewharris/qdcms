<cfobject component="formvalidation" name="objformvalidation">
<cfset objformvalidation.set_rules('name','Name','required,max_len[64]')>
<cfset objformvalidation.set_rules('wpcontent','Content','required')>
<cfinclude template="/actions/checkforerrorsinform.cfm">