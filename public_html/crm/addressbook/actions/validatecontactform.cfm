<cfobject component="formvalidation" name="objformvalidation">
<cfset objformvalidation.set_rules('firstname','First Name','required,max_len[32]')>
<cfset objformvalidation.set_rules('lastname','Last Name','required,max_len[32]')>
<!--- <cfset objformvalidation.set_rules('mphone','Cell Phone','phone')>
<cfset objformvalidation.set_rules('hphone','Home Phone','phone')>
<cfset objformvalidation.set_rules('wphone','Work Phone','phone')>
<cfset objformvalidation.set_rules('ophone','Other Phone','phone')> --->
<cfset objformvalidation.set_rules('fphone','Fax','phone')>
<!--- <cfset objformvalidation.set_rules('zip','Zip','zip')> --->
<cfset objformvalidation.set_rules('hemail','Home Email','email')>
<cfset objformvalidation.set_rules('wemail','Work Email','email')>
<cfset objformvalidation.set_rules('memail','Mobile Email','email')>

<cfinclude template="/actions/checkforerrorsinform.cfm">