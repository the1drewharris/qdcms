<cfswitch expression="#url.action#">
	<cfcase value="actionaddhauoption">
		<cfset request.stream="added a heard about us option">
		<cfinclude template="actions/addhauoption.cfm">
	</cfcase>
	<cfcase value="actionedithauoption">
		<cfset request.stream="edited a heard about us option">
		<cfinclude template="actions/edithauoption.cfm">
	</cfcase>
	<cfcase value="actionaddhautoevent">
		<cfset request.stream="added a heard about option for an event">
		<cfinclude template="actions/addhautoevent.cfm">
	</cfcase>
	<cfcase value="deletehauoption">
		<cfset request.stream="deleted a heard about us option">
		<cfinclude template="actions/deletehauoption.cfm">
	</cfcase>
	<cfdefaultcase>
		<cfset request.stream=0>
		<cfinclude template="layout/default.cfm">
	</cfdefaultcase>
</cfswitch>