<cfswitch expression="#url.action#">
	<cfcase value="actionaddadvertisement">
		<cfset request.stream="added an ad">
		<cfinclude template="actions/addadvertisement.cfm">
	</cfcase>
	<cfcase value="actioneditadvertisement">
		<cfset request.stream="edited an ad">
		<cfinclude template="actions/editadvertisement.cfm">
	</cfcase>
	<cfcase value="deletead">
		<cfset request.stream="deleted an ad">
		<cfinclude template="actions/deletead.cfm">
	</cfcase>
	<cfcase value="restoread">
		<cfset request.stream="restored an ad">
		<cfinclude template="actions/restoread.cfm">
	</cfcase>
	<cfdefaultcase>
		<cfset request.stream=0>
		<cfinclude template="layout/default.cfm">
	</cfdefaultcase>
</cfswitch>