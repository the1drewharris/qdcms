<cfparam name="url.qrelationidList" default="0">
<cfif url.qrelationidList NEQ '0'>
	<cftransaction>
		<cfinvoke component="#application.objsurvey#" method="deleterelation" surveydsn='#client.siteurl#' qrelationidList="#url.qrelationidList#">
	</cftransaction>
	<cfinclude template="/actions/tracking.cfm">
</cfif>
<cflocation url="#CGI.HTTP_REFERER#" addtoken="false">