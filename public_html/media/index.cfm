<cfswitch expression="#url.module#">
	<cfcase value="imagemgmt">
		<cfinclude template="imagemgmt/index.cfm">
	</cfcase>
	<cfcase value="videomgmt">
		<cfinclude template="videomgmt/index.cfm">
	</cfcase>
	<cfcase value="filemgmt">
		<cfinclude template="filemgmt/index.cfm">
	</cfcase>
	<cfcase value="audiomgmt">
		<cfinclude template="audiomgmt/index.cfm">
	</cfcase>
	<cfdefaultcase>
		<cfinclude template="layout/default.cfm">
	</cfdefaultcase>
</cfswitch>