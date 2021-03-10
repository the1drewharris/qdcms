<cfinclude template="validateadditemtoproductgroupform.cfm">
<cfif thereAreNoErrorsInForm>
	<cfset form.productdsn=client.siteurl>
	<cftransaction>
		<cfinvoke component="#application.objproduct#" method="groupProduct" argumentcollection="#form#">
	</cftransaction>
	<cfinclude template="/actions/tracking.cfm">
</cfif>
<cflocation url="/cms/#url.section#/#url.module#/additemtoproductgroup/?id=#form.groupid#" addtoken="false">