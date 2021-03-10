<cfobject component="formvalidation" name="objformvalidation">
<cfset objformvalidation.set_rules('adname','Advertisement Name','required,max_len[64]')>
<cfset objformvalidation.set_rules('advertiser_nameid','Client','required')>
<cfset objformvalidation.set_rules('zoneid','Zone','required')>
<cfset objformvalidation.set_rules('target_url','Target URL','max_len[248]')>
<cfset objformvalidation.set_rules('startdate','Start Date','required')>
<cfset objformvalidation.set_rules('enddate','End Date','required')>
<cfif form.maxclick NEQ "Unlimited">
	<cfset objformvalidation.set_rules('maxclick','Maximum Click Allowed','numeric')>
</cfif>
<cfif form.maximpression NEQ "Unlimited">
	<cfset objformvalidation.set_rules('maximpression','Maximum Impression Allowed','numeric')>
</cfif>

<cfinclude template="/actions/checkforerrorsinform.cfm">
<cfif thereAreNoErrorsInForm>
	<cfif form.maxclick Eq "Unlimited">
		<cfset form.maxclick=0>
	</cfif>
	<cfif form.maximpression EQ "Unlimited">
		<cfset form.maximpression=0>
	</cfif>
</cfif>