<cfobject component="formvalidation" name="objformvalidation">
<cfif url.action EQ "addnewsiteaction">
	<cfset objformvalidation.set_rules('firstname','First Name','required,max_len[32]')>
	<cfset objformvalidation.set_rules('lastname','Last Name','required,max_len[32]')>
	<cfset objformvalidation.set_rules('pw','Password','password')>
</cfif>
<cfset objformvalidation.set_rules('sitename','Site Name','required,min_len[3],max_len[64]')>
<cfset objformvalidation.set_rules('scity','Site City','required,max_len[64]')>
<cfset objformvalidation.set_rules('sstate','Site State','required,max_len[64]')>
<cfset objformvalidation.set_rules('orgname','Organization Name','required,max_len[64]')>
<cfset objformvalidation.set_rules('sitetitle','Site Title','required,max_len[128]')>
<cfset objformvalidation.set_rules('subtitle','Sub Title','max_len[128]')>
<cfset objformvalidation.set_rules('siteurl','Site URL','required,max_len[64]')>
<cfset objformvalidation.set_rules('sitekeywords','Site Keywords','required')>
<cfset objformvalidation.set_rules('sitedescription','Site Description','required')>
<cfset objformvalidation.set_rules('orgphone','Site Phone Number','required,phone')>
<cfset objformvalidation.set_rules('defaultareacode','Default Area Code','required,numeric,max_len[3]')>
<cfset objformvalidation.set_rules('commentemail','comments Email to','required,email')>
<cfset objformvalidation.set_rules('cc_commentemail','CC Emailed to','email')>
<cfinclude template="/actions/checkforerrorsinform.cfm">