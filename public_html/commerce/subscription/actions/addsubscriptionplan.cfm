<cfinclude template="validatesubscriptionplanform.cfm">
<cfif thereAreNoErrorsInForm>
	<cfparam name="form.startselling" default="0">
	<cfset form.productdsn=client.siteurl>
	<cfset form.subscriptiondsn=client.siteurl>
	<cfset form.idfor='Subscriptionplan'>
	<cfif form.startselling NEQ 0>
		<cfset form.stopselling=0>
	<cfelse>
		<cfset form.stopselling=1>
	</cfif>
	<cftransaction>
		<cfinvoke component="#application.objproduct#" method="createID" argumentcollection="#form#" returnvariable="form.id">
		<cfinvoke component="#application.objsubscription#" method="addsubscriptionplans" argumentcollection="#form#">
	</cftransaction>
	<cfinclude template="/actions/tracking.cfm">
	<cflocation url="/cms/#url.section#/#url.module#/subscriptionplans" addtoken="false">
<cfelse>
	<cflocation url="#CGI.HTTP_REFERER#" addtoken="false">
</cfif>