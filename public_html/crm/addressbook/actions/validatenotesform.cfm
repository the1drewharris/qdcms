<cfobject component="formvalidation" name="objformvalidation">
<cfset objformvalidation.set_rules('subject','Subject','required, max_len[64]')>
<cfset objformvalidation.set_rules('comment','Note','required')>
<cfset objformvalidation.set_rules('to','To','email')>
<cfinclude template="/actions/checkforerrorsinform.cfm">