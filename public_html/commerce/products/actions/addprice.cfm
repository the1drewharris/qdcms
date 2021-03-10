<cfinclude template="validatepriceform.cfm">
<cfif thereAreNoErrorsInForm>
	<cfset form.productdsn=client.siteurl>
	<cftransaction>
		<cfinvoke component="#application.objproduct#" method="addpricename" argumentcollection="#form#">
	</cftransaction>
	<cfinclude template="/actions/tracking.cfm">
	<cflocation url="/cms/#url.section#/#url.module#/showprices" addtoken="false">
<cfelse>
	<cflocation url="#CGI.HTTP_REFERER#" addtoken="false">
</cfif>