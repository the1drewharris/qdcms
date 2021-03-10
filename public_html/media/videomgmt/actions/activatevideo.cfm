<cfparam name="url.v" default="0">
<cfset refererRegex='http://[www.]?#application.dsn#/cms/#url.section#/#url.module#/inactivevideos'>
<cfset result=ReMatch(refererRegex,CGI.HTTP_REFERER)>
<cfif ArrayLen(result) GT 0>
	<cftransaction>
		<cfinvoke component="#application.objvideolib#" method="updateVideoStatus" videodsn="#client.siteurl#" vid="#url.v#" status="Public">
	</cftransaction>
	<cfinclude template="/actions/tracking.cfm">
</cfif>
<cflocation url="#CGI.HTTP_REFERER#" addtoken="false">