<cfswitch expression="#url.action#">
	<cfcase value="addpatchaction">
		<cfset request.stream="added a patch">
		<cfinclude template="actions/addpatch.cfm">
	</cfcase>
	<cfcase value="editpatchaction">
		<cfset request.stream="edited a patch">
		<cfinclude template="actions/editpatch.cfm">
	</cfcase>
	<cfdefaultcase>
		<cfset request.stream=0>
		<cfinclude template="layout/default.cfm">
	</cfdefaultcase>
</cfswitch>