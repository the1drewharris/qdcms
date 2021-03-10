<cfswitch expression="#url.action#">
	<cfcase value="actionaddlink">
		<cfset request.stream="added a link">
		<cfinclude template="actions/addlink.cfm">
	</cfcase>
	<cfcase value="actioneditlink">
		<cfset request.stream="edited a link">
		<cfinclude template="actions/editlink.cfm">
	</cfcase>
	<cfcase value="deletelink">
		<cfset request.stream="deleted a link">
		<cfinclude template="actions/deletelink.cfm">
	</cfcase>
	<cfdefaultcase>
		<cfset request.stream=0>
		<cfinclude template="layout/default.cfm">
	</cfdefaultcase>
</cfswitch>