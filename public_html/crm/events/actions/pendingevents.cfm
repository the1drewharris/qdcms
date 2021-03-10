<cfparam name="form.approve" default="">
<cfparam name="form.delete" default="">

<cftransaction>
	<cfif listlen(form.approve) GT 0>
		<cfloop list="#form.approve#" index="eventid">
			<cfinvoke component="#application.objevent#" method="updateEventStatus" eventdsn="#client.siteurl#" eventid="#eventid#" status="public">
		</cfloop>
	</cfif>
		
	<cfif listlen(form.delete) GT 0>
		<cfloop list="#form.delete#" index="eventid">
			<cfinvoke component="#application.objevent#" method="deleteEvent" eventdsn="#client.siteurl#" eventid="#eventid#">
		</cfloop>
	</cfif>
</cftransaction>
<cfinclude template="/actions/tracking.cfm">

<cflocation url="#CGI.HTTP_REFERER#" addtoken="false">