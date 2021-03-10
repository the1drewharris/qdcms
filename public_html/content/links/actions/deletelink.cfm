<cfparam name="url.linkList" default="0">
<cfloop list="#url.linkList#" index="linkid">
	<cfinvoke component="#application.objlinks#" method="deleteLink" ds="#client.siteurl#" linkid="#linkid#">
</cfloop>
<cfinclude template="/actions/tracking.cfm">
<cflocation url="#CGI.HTTP_REFERER#" addtoken="false">