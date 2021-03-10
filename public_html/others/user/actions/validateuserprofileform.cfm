<cfobject component="formvalidation" name="objformvalidation">
<cfset objformvalidation.set_rules('firstname','First Name','required,max_len[96]')>
<cfset objformvalidation.set_rules('lastname','Last Name','required,max_len[96]')>
<cfset objformvalidation.set_rules('wemail','Email','required,email')>
<cfset objformvalidation.set_rules('company','Company','max_len[248]')>
<cfset objformvalidation.set_rules('title','Title','max_len[96]')>
<cfset objformvalidation.set_rules('myusername','Username','max_len[96],email')>
<cfset objformvalidation.set_rules('mypassword','Password','min_len[6],max_len[14]')>
<cfset objformvalidation.set_rules('confirm','Confirm Password','matches[mypassword]')>
<cfset objformvalidation.set_rules('address1','Address 1','required,max_len[96]')>
<cfset objformvalidation.set_rules('address2','Address 2','max_len[96]')>
<cfset objformvalidation.set_rules('city','City','required,max_len[96]')>
<cfset objformvalidation.set_rules('zip','Zip','max_len[96],zip')>
<cfset objformvalidation.set_rules('hphone','Home Phone','required,phone')>
<cfset objformvalidation.set_rules('wphone','Work Phone','phone')>
<cfset objformvalidation.set_rules('mphone','Cell Phone','phone')>
<cfinclude template="/actions/checkforerrorsinform.cfm">