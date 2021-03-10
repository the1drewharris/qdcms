<cfobject component="formvalidation" name="objformvalidation">
<cfset objformvalidation.set_rules('itemname','Product Name','required,max_len[248]')>
<cfif url.action EQ 'actionaddproduct'>
	<cfset objformvalidation.set_rules('quantity','Quantity','required,numeric')>
</cfif>
<cfif Trim(form.categoryid) EQ ''>
	<cfset objformvalidation.addError('Select at least one category')>
</cfif>
<cfset objformvalidation.set_rules('description','Description','required')>
<cfset objformvalidation.set_rules('attributes','Keywords','required,max_len[2048]')>
<cfif not isDefined('form.startselling')>
	<cfset form.startselling=0>
</cfif>
<cfif form.startselling EQ 1>
	<cfinvoke component="#application.objproduct#" method="getPricenames" productdsn="#client.siteurl#" returnvariable="allPrices">
	<cfloop query="allPrices">
		<cfset objformvalidation.set_rules('priceid:#pricenameid#','#pricename# price','required,numeric')>
	</cfloop>
</cfif>

<cfinclude template="/actions/checkforerrorsinform.cfm">