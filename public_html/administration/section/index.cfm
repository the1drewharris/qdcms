<cfswitch expression="#url.action#">
	<cfcase value="addsectionaction">
		<cfset request.stream="added section(s)">
		<cfinclude template="actions/addsectionaction.cfm">
	</cfcase>
	<cfcase value="editsectionaction">
		<cfset request.stream="edited sections(s)">
		<cfinclude template="actions/editsectionaction.cfm">
	</cfcase>
	<cfcase value="deletesectionaction">
		<cfset request.stream="deleted section(s)">
		<cfinclude template="actions/deletesectionaction.cfm">
	</cfcase>
	<cfcase value='actionsortsections'>
		<cfset request.stream="resorted section(s)">
		<cfinclude template="actions/sortsections.cfm">
	</cfcase>
	<cfcase value="actionsortmodules">
		<cfset request.stream="resorted module(s)">
		<cfinclude template="actions/sortmodules.cfm">
	</cfcase>
	<cfdefaultcase>
		<cfset request.stream=0>
		<cfinclude template="layout/default.cfm">
	</cfdefaultcase>
</cfswitch>