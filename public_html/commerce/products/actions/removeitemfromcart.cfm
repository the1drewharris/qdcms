<cfparam name="url.c" default="0">
<cfparam name="url.id" default="0">
<cfparam name="url.q" default="0">
<cfset allIsWell=FALSE>
<cfif isNumeric(url.c) AND url.c GT 0>
	<cfif isNumeric(url.id) AND url.id GT 0>
		<cfif isNumeric(url.q) AND url.q GT 0>
			<cfset allIsWell=TRUE>
		</cfif>
	</cfif>
</cfif>

<cfif allIsWell>
	<cftransaction>
		<cfinvoke component="#application.objnewcart#" method="removeitem" cartdsn="#client.siteurl#" id="#url.id#" cartid="#url.c#" quantity="#url.q#">
	</cftransaction>
	<cfinclude template="/actions/tracking.cfm">
	<cflocation url="#CGI.http_referer#" addtoken="false">
<cfelse>
	<cflocation url="/cms/#url.section#/#url.module#/showcarts" addtoken="false">
</cfif>