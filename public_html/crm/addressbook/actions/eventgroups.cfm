<cfset args=structNew()>
<cfset args.eventdsn=client.siteurl>
<cfset args.nameid=form.nameid>
<cfparam name="client.referer" default="/cms/#url.section#/#url.module#/showcontacts">
<cftransaction>
	<cfinvoke component="#application.objevent#" method="deleteallgroupsfornameid" argumentcollection="#args#">
	<cfinvoke component="#application.objevent#" method="getEventsWithGroupsAsssigned" eventdsn="#client.siteurl#" returnvariable="eventwithgroups">
	<cfinvoke component="#application.abCFC#" method="getGroupInfo" contactdsn="#client.siteurl#" returnvariable="allgroups">
	<cfloop query="eventwithgroups">
		<cfset args.eventid=eventid>
		<cfinvoke component="#application.objevent#" method="getGroupsForEvent" argumentcollection="#args#" returnvariable="groupsinevent">
		<cfloop query="allgroups">
			<cfset args.usergroupid=groupid>
			<cfif isDefined('form.ug_#args.usergroupid#_#args.eventid#')>
				<!--- invoke a function here --->
				<cfinvoke component="#application.objevent#" method="addpeople2event" argumentcollection="#args#">
			</cfif>
		</cfloop>
	</cfloop>
</cftransaction>
<cfinclude template="/actions/tracking.cfm">
<cflocation url="#client.referer#" addtoken="false">