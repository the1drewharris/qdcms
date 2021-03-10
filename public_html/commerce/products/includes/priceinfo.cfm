<cfif NOT thereAreErrors> <!--- thereAreErrors is defined in /display/errors.cfm --->
	<cfparam name="url.p" default="">
	<cfset Session.formValues['pricenameid']=url.p>
	<cfset Session.formValues['pricename']=application.objproduct.getPriceName(client.siteurl,url.p)>
</cfif>