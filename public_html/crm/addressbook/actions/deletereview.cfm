<cfparam name="url.id" default="0">
<cfif url.id NEQ 0>
	<cftransaction>
		<cfinvoke component="#application.objreview#" method="deleteReview" reviewdsn="#client.siteurl#" reviewid="#url.id#">
	</cftransaction>
	<cfinclude template="/actions/tracking.cfm">
	<cfset client.message="Review has been deleted">
</cfif>
<cflocation url="#CGI.HTTP_REFERER#" addtoken="false">