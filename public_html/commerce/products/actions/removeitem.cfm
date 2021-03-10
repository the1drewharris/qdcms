<cfparam name="url.id" default="0">
<cfparam name="url.g" default="0">
<cfif isNumeric(url.g)>
	<cfif isNumeric(url.id)>
		<cfinvoke component="#application.objproduct#" method="removeItemFromGroup" productdsn="#client.siteurl#" groupid="#url.g#" productid="#url.id#">
	</cfif>
</cfif>
<cfinclude template="/actions/tracking.cfm">
<cflocation url="#CGI.HTTP_REFERER#" addtoken="false">