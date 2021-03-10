<cfswitch expression="#url.module#">
	<cfcase value="errorhandling">
	</cfcase>
	<cfcase value="project">
	</cfcase>
	<cfcase value="task">
	</cfcase>
	<cfcase value="troubleticket">
		<cfinclude template="troubleticket/index.cfm">
	</cfcase>
	<cfdefaultcase>
		<cfinclude template="layout/default.cfm">
	</cfdefaultcase>
</cfswitch>