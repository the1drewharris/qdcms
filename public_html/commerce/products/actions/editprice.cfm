<cfinclude template="validatepriceform.cfm">
<cfif thereAreNoErrorsInForm>
	<cfset form.productdsn=client.siteurl>
	<cfset form.newpricename=form.pricename>
	<cftransaction>
		<cfinvoke component="#application.objproduct#" method="editpricename" argumentcollection="#form#">
	</cftransaction>
	<cfinclude template="/actions/tracking.cfm">
	<cflocation url="/cms/#url.section#/#url.module#/showprices" addtoken="false">
<cfelse>
	<cflocation url="#CGI.HTTP_REFERER#" addtoken="false">
</cfif>