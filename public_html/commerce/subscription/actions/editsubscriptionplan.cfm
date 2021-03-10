<cfinclude template="validatesubscriptionplanform.cfm">
<cfif thereAreNoErrorsInForm>
	<cfparam name="form.startselling" default="0">
	<cfset form.subscriptiondsn=client.siteurl>
	<cfset form.productdsn=client.siteurl>
	<cfset form.id=form.subscriptionplanid>
	<cfif form.startselling EQ 1>
		<cfset form.stopselling=0>
	<cfelse>
		<cfset form.stopselling=1>
	</cfif>
	<cftransaction>
		<cfinvoke component="#application.objproduct#" method="updateIDPoolInfo" argumentcollection="#form#">
		<cfinvoke component="#application.objsubscription#" method="updatesubscriptionplan" argumentcollection="#form#">
	</cftransaction>
	<cfinclude template="/actions/tracking.cfm">
	<cflocation url="/cms/#url.section#/#url.module#/subscriptionplans" addtoken="false">
<cfelse>
	<cflocation url="#CGI.HTTP_REFERER#" addtoken="false">
</cfif>