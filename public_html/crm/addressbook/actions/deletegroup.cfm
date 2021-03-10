<cfparam name="url.g" default="0">
<cfinvoke component="#application.abCFC#" method="getGroupInfo" contactdsn="#client.siteurl#" groupid="#url.g#" returnVariable="groupInfo" />
<cfif groupInfo.recordcount EQ 1>
	<cfif groupInfo.groupCount EQ 0>
		<cftransaction>
			<cfinvoke component="#application.abCFC#" method="deleteGroup" contactdsn="#client.siteurl#" groupid="#groupInfo.groupid#" />
		</cftransaction>
		<cfinclude template="/actions/tracking.cfm">
	<cfelse>
		<cfset client.message="Please remove all the contacts from the group to delete this group">
	</cfif>
<cfelse>
	<cfset client.message="The group you requested to delete does not exist">
</cfif>

<cflocation url="#CGI.http_referer#" addtoken="false">