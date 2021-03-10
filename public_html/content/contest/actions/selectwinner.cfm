<cfparam name="url.contestid" default="0">
<cfparam name="url.nameid" default="0">
<cfif url.contestid NEQ 0>
	<cftransaction>
		<cfif url.nameid EQ 0>
			<cfinvoke component="#Application.objcontest#" method="randomWinner" returnvariable="winner" contestdsn="#client.siteurl#" contestid="#url.contestid#">
		<cfelse>
			<cfset winner=url.nameid>
		</cfif>
		<cfinvoke component="#Application.objcontest#" method="addwinner" contestdsn="#client.siteurl#" contestid="#url.contestid#" nameid="#winner#">
	</cftransaction>
</cfif>
<cfinclude template="/actions/tracking.cfm">

<cflocation url="#CGI.HTTP_REFERER#" addtoken="false">
