<cfobject component="formvalidation" name="objformvalidation">
<cfset objformvalidation.set_rules('id','Subscriable Item','required')>
<cfset objformvalidation.set_rules('pricenameid','Price Name','required')>
<cfset objformvalidation.set_rules('price','Price','required,numeric')>
<cfinclude template="/actions/checkforerrorsinform.cfm">