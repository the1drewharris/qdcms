<cfinclude template="validateproductgroupform.cfm">
<cfif thereAreNoErrorsInForm>
	<cfparam name="form.startselling" default="0">
	<cfif form.startselling EQ 1>
		<cfset form.stopselling=0>
	<cfelse>
		<cfset form.stopselling=1>
	</cfif>
	<cfset form.productdsn=client.siteurl>
	<cftransaction>
		<cfinvoke component="#application.objproduct#" method="addProductGroup" argumentcollection="#form#">
	</cftransaction>
	<cfinclude template="/actions/tracking.cfm">
	<cflocation url="/cms/#url.section#/#url.module#/showproductgroups" addtoken="false">
<cfelse>
	<cflocation url="#CGI.HTTP_REFERER#" addtoken="false">
</cfif>