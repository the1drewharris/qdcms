<cfswitch expression="#url.module#">
	<cfcase value="admanagement">
		<cfinclude template="admanagement/index.cfm">
	</cfcase>
	<cfcase value="newsletter">
		<cfinclude template="newsletter/index.cfm">
	</cfcase>
	<cfcase value="heardaboutus">
		<cfinclude template="heardaboutus/index.cfm">
	</cfcase>
	<cfdefaultcase>
		<cfinclude template="layout/default.cfm">
	</cfdefaultcase>
</cfswitch>