<cfswitch expression="#url.action#">
	<cfcase value="adduseraction">
		<cfset request.stream="added a user">
		<cfinclude template="actions/adduseraction.cfm">
	</cfcase>
	<cfcase value="edituseraction">
		<cfset request.stream="edited a user">
		<cfinclude template="actions/edituseraction.cfm">
	</cfcase>
	<cfcase value="editpermissionaction">
		<cfset request.stream="edited permissions">
		<cfinclude template="actions/editpermissionaction.cfm">
	</cfcase>
	<cfcase value="showmodules"> <!--- display part accessed only via ajax --->
		<cfset request.stream="viewed the modules">
		<cfinclude template="display/modules.cfm">
	</cfcase>
	<cfdefaultcase>
		<cfset request.stream=0>
		<cfinclude template="layout/default.cfm">
	</cfdefaultcase>
</cfswitch>