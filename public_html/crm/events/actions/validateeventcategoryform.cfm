<cfobject component="formValidation" name="objformValidation">
<cfset objformValidation.set_rules('eventcategory','Event Category','required,min_len[2],max_len[32]')>
<cfset objformValidation.set_rules('description','Description','required')>
<cfinclude template="/actions/checkforerrorsinform.cfm">