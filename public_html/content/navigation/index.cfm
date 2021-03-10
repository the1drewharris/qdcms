<cfswitch expression="#url.action#">
	<cfcase value="savenavigation">
		<cfset request.stream="saved a navigation">
		<cfinclude template="actions/savenavigation.cfm">
	</cfcase>
	<cfcase value="deactivatenavigation">
		<cfset request.stream="deactivated a navigation">
		<cfinclude template="actions/deactivatenavigation.cfm">
	</cfcase>
	<cfcase value="restorenavigation">
		<cfset request.stream="restored a navigation">
		<cfinclude template="actions/restorenavigation.cfm">
	</cfcase>
	<cfdefaultcase>
		<cfset request.stream=0>
		<cfinclude template="layout/default.cfm">
	</cfdefaultcase>
</cfswitch>