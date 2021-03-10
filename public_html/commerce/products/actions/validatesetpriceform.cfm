<cfobject component="formvalidation" name="objformvalidation">
<cfset objformvalidation.set_rules('id','Product Name','required')>
<cfset objformvalidation.set_rules('pricenameid', 'Price Name','required')>
<cfset objformvalidation.set_rules('price','Price','required,Numeric')>
<cfinclude template="/actions/checkforerrorsinform.cfm">