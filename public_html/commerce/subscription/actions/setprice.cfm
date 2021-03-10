<cfinclude template="validatesetpriceform.cfm">
<cfif thereAreNoErrorsInForm>
	<cfset form.productdsn=client.siteurl>
	<cftransaction>
		<cfinvoke component="#application.objproduct#" method="setprice" argumentcollection="#form#">
	</cftransaction>
	<cfinclude template="/actions/tracking.cfm">
</cfif>
<cflocation url="#CGI.HTTP_REFERER#" addtoken="false">