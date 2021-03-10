<cfobject component="formvalidation" name="objformvalidation">
<cfset objformvalidation.set_rules('answerchoice','Answer Choice','required,max_len[96]')>
<cfinclude template="/actions/checkforerrorsinform.cfm">