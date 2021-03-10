<cfswitch expression="#url.module#">
	<cfcase value="addressbook">
		<cfinclude template="/crm/addressbook/index.cfm">
	</cfcase>
	<cfcase value="events">
		<cfinclude template="/crm/events/index.cfm">
	</cfcase>
	<cfdefaultcase>
		<cfinclude template="/crm/layout/default.cfm">
	</cfdefaultcase>
</cfswitch>