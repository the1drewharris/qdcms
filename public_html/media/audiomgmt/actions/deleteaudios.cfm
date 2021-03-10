<cfloop list="#url.l#" index="vid">
	<cfinvoke component="#Application.objvideolib#" method="updateVideoStatus" videodsn="#client.siteurl#" vid="#vid#" status="Inactive">
</cfloop>
<cfinclude template="/actions/tracking.cfm">
<cflocation url="#CGI.HTTP_REFERER#" addtoken="false">