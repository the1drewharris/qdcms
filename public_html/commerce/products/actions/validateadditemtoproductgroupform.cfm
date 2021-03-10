<cfobject component="formvalidation" name="objformvalidation">
<cfset objformvalidation.set_rules('productid','Item','required,numeric')>
<cfinclude template="/actions/checkforerrorsinform.cfm">