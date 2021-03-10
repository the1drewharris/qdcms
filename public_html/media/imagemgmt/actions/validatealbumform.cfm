<cfobject component="formvalidation" name="objformvalidation">
<cfset objformvalidation.set_rules('galleryname','Title','required,max_len[64]')>
<cfset objformvalidation.set_rules('status','Status','required')>
<cfinclude template="/actions/checkforerrorsinform.cfm">