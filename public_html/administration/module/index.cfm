<cfswitch expression="#url.action#">
	<cfcase value="addmoduleaction">
		<cfset request.stream="added module(s)">
		<cfinclude template="/administration/module/actions/addmoduleaction.cfm">
	</cfcase>
	<cfcase value="editmoduleaction">
		<cfset request.stream="added module(s)">
		<cfinclude template="/administration/module/actions/editmoduleaction.cfm">
	</cfcase>
	<cfcase value="deletemoduleaction">
		<cfset request.stream="deleted module(s)">
		<cfinclude template="/administration/module/actions/deletemoduleaction.cfm">
	</cfcase>
	<cfdefaultcase>
		<cfset request.stream=0>
		<cfinclude template="/administration/module/layout/default.cfm">
	</cfdefaultcase>
</cfswitch>