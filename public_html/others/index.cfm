<cfswitch expression="#url.module#">
	<cfcase value="user">
		<cfinclude template="user/index.cfm">
	</cfcase>
	<cfdefaultcase>
		<cfinclude template="dashboard/index.cfm">
	</cfdefaultcase>
</cfswitch>