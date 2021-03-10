<cfswitch expression="#url.action#">	
<cfcase value="actionaddemailserver">
		<cfset request.stream="added an email server">
		<cfinclude template="actions/addemailserver.cfm">
	</cfcase>
	<cfcase value="actioneditemailserver">
		<cfset request.stream="edited an email server">
		<cfinclude template="actions/editemailserver.cfm">
	</cfcase>
	<cfcase value="assigntoken">
		<cfset request.stream="assigned an email server token">
		<cfinclude template="actions/assigntoken.cfm">
	</cfcase>
	<cfdefaultcase>
		<cfset request.stream=0>
		<cfinclude template="layout/default.cfm">
	</cfdefaultcase>
</cfswitch>