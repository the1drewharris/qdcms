<cfset error=0>
<cfloop list="#url.contestList#" index="id">
	<cftry>
		<cfinvoke component="#Application.objcontest#" method="deleteContest" contestdsn="#client.siteurl#" contestid="#id#">
		<cfcatch type="any">
			<cfset client.message="Some contest could not be deleted because people are signed up for the contest">
		</cfcatch>
	</cftry>
</cfloop>
<cfinclude template="/actions/tracking.cfm">
<cflocation url="#CGI.HTTP_REFERER#" addtoken="false">