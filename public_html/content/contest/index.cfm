<cfswitch expression="#url.action#">
	<cfcase value="actionaddcontest">
		<cfset request.stream="added a contest">
		<cfinclude template="actions/addcontest.cfm">
	</cfcase>
	<cfcase value="actioneditcontest">
		<cfset request.stream="edited a contest">
		<cfinclude template="actions/editcontest.cfm">
	</cfcase>
	<cfcase value="delete">
		<cfset request.stream="deleted a contest">
		<cfinclude template="actions/deletecontest.cfm">
	</cfcase>
	<cfcase value="copy">
		<cfset request.stream="copied a contest">
		<cfinclude template="actions/copycontest.cfm">
	</cfcase>
	<cfcase value="selectwinner">
		<cfset request.stream="selected a winner of a contest">
		<cfinclude template="actions/selectwinner.cfm">
	</cfcase>
	<cfdefaultcase>
		<cfset request.stream=0>
		<cfinclude template="layout/default.cfm">
	</cfdefaultcase>
</cfswitch>