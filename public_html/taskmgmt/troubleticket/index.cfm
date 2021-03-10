<cfset thisSite='quantumdelta.com'> <!--- This is done because this module interacts only with tables in quantumdelta.com --->
<cfswitch expression="#url.action#">
	<cfcase value="actionaddtaskfromincident">
		<cfset request.stream="added a task from an incident changing the status to processing">
		<cfinclude template="actions/addtask.cfm">
	</cfcase>
	<cfcase value="actionaddcomment">
		<cfset request.stream="added a comment to an incident">
		<cfinclude template="actions/addcomment.cfm">
	</cfcase>
	<cfcase value="actionreportincident">
		<cfset request.stream="reported an incident">
		<cfinclude template="actions/reportincident.cfm">
	</cfcase>
	<cfdefaultcase>
		<cfset request.stream=0>
		<cfinclude template="layout/default.cfm">
	</cfdefaultcase>
</cfswitch>