<cfswitch expression="#url.action#">
	<cfcase value="editroleaction">
		<cfset request.stream="edited role(s)">
		<cfinclude template="actions/editroleaction.cfm">
	</cfcase>
	<cfdefaultcase>
		<cfinclude template="layout/default.cfm">
	</cfdefaultcase>
</cfswitch>