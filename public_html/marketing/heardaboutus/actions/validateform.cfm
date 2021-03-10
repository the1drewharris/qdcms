<cfobject component="formvalidation" name="objformvalidation">
<cfset objformvalidation.set_rules('aboutus','About Us Name','required,max_len[64]')>
<cfinclude template="/actions/checkforerrorsinform.cfm">