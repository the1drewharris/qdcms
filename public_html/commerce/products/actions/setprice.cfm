<cfinclude template="validatesetpriceform.cfm">
<cfif thereAreNoErrorsInForm>
	<cfset form.productdsn=client.siteurl>
	<cftransaction>
		<cfinvoke component="#application.objproduct#" method="setPrice" argumentcollection="#form#">
	</cftransaction>
	<cfinclude template="/actions/tracking.cfm">
	<cflocation url="/cms/#url.section#/#url.module#/setprice/?p=#form.id#" addtoken="false">
<cfelse>
	<cflocation url="#CGI.HTTP_REFERER#" addtoken="false">
</cfif>