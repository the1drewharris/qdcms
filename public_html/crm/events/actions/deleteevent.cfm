<cfparam name="url.eventid" default="0">
<cfparam name="url.instanceid" default="0">

<cfset deleteInstance=FALSE>
<cfset deleteEvent=FALSE>

<cfif isNumeric(url.instanceid) AND url.instanceid GT 0>
	<cfset deleteInstance=TRUE>
<cfelseif isNumeric(url.eventid) AND url.eventid GT 0>
	<cfset deleteEvent=TRUE>
</cfif>

<cfif deleteInstance>
	<cfinvoke component="#Application.objevent#" method="deleteOneRecurringEvent" eventdsn="#client.siteurl#" eventinstanceid="#url.instanceid#">
<cfelseif deleteEvent>
	<cfinvoke component="#Application.objevent#" method="deleterecurringevent" eventdsn="#client.siteurl#" eventid="#url.eventid#">
	<cfinvoke component="#Application.objevent#" method="deleteEvent" eventdsn="#client.siteurl#" eventid="#url.eventid#">
</cfif>
<cfinclude template="/actions/tracking.cfm">
<cflocation url="#CGI.HTTP_REFERER#" addtoken="FALSE">