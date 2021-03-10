<cfobject component="formvalidation" name="objformvalidation">
<cfset objformvalidation.set_rules('imagetitle','Title','max_len[96]')>
<cfset objformvalidation.set_rules('imagealt','Alt','max_len[96]')>
<cfinclude template="/actions/checkforerrorsinform.cfm">