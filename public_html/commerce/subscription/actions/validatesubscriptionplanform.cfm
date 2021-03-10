<cfobject component="formvalidation" name="objformvalidation">
<cfset objformvalidation.set_rules('subscriableid','Subscriable Item','required,numeric')>
<cfset objformvalidation.set_rules('itemname','Name of the Plan','required,max_len[128]')>
<cfif objformvalidation.isValidForm()>
	<cfset itemAlreadyExists=application.objproduct.checkItemname(client.siteurl,form.itemname,form.subscriptionplanid)>
	<cfif itemAlreadyExists EQ 1>
		<cfset objformvalidation.addError('Subscription plan or product item #form.itemname# already exists')>
	</cfif>
</cfif>
<cfset objformvalidation.set_rules('term','Term Value','required,numeric,max_val[1000]')>
<cfset objformvalidation.set_rules('termmeasure','Term Measure','required')>
<cfinclude template="/actions/checkforerrorsinform.cfm">