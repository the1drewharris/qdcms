<!--- security documentation --->
<cfswitch expression="#url.module#">
	<cfcase value="site">
		<cfinclude template="site/index.cfm">
	</cfcase>
	<cfcase value="roles">
		<cfinclude template="roles/index.cfm">
	</cfcase>
	<cfcase value="users">
		<cfinclude template="users/index.cfm">
	</cfcase>
	<cfcase value="section">
		<cfinclude template="section/index.cfm">
	</cfcase>
	<cfcase value="module">
		<cfinclude template="module/index.cfm">
	</cfcase>
	<cfcase value="patches">
		<cfinclude template="patches/index.cfm">
	</cfcase>
	<cfcase value="emailserver">
		<cfinclude template="emailserver/index.cfm">
	</cfcase>
	<cfdefaultcase>
		<cfinclude template="/administration/layout/default.cfm">
	</cfdefaultcase>
</cfswitch>