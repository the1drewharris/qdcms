<cfobject component="formvalidation" name="objformvalidation">
<cfset objformvalidation.set_rules('name','Displayname','required-or-nothing,max_len[96]')>
<cfinclude template="/actions/checkforerrorsinform.cfm">