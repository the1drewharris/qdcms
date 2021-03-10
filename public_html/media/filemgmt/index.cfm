<cfswitch expression="#url.action#">
	<cfcase value="actionaddfile">
		<cfset request.stream="added/uploaded a static file">
		<cfinclude template="actions/addfile.cfm">
	</cfcase>
	<cfcase value="actioneditfile">
		<cfset request.stream="edited a static file">
		<cfinclude template="actions/editfile.cfm">
	</cfcase>
	<cfcase value="deletefile">
		<cfset request.stream="deleted a static file">
		<cfinclude template="actions/deletefile.cfm">
	</cfcase>
	<cfdefaultcase>
		<cfset request.stream=0>
		<cfinclude template="layout/default.cfm">
	</cfdefaultcase>
</cfswitch>