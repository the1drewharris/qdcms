<cfswitch expression="#url.action#">
	<cfcase value="revokecancellation">
		<cfset request.stream="revoked cancellation">
		<cfinclude template="actions/revokecancellation.cfm">
	</cfcase>
	<cfcase value="cancelsubscription">
		<cfset request.stream="canceled subscription">
		<cfinclude template="actions/cancelsubscription.cfm">
	</cfcase>
	<cfcase value="renewsubscription">
		<cfset request.stream="renewed subscription">
		<cfinclude template="actions/renewsubscription.cfm">
	</cfcase>
	<cfcase value="activatesubscription">
		<cfset request.stream="activated subscription">
		<cfinclude template="actions/activatesubscription.cfm">
	</cfcase>
	<cfcase value="deactivatesubscription">
		<cfset request.stream="deactived subscription">
		<cfinclude template="actions/deactivatesubscription.cfm">
	</cfcase>
	<cfcase value="actionsetprice">
		<cfset request.stream="set a price">
		<cfinclude template="actions/setprice.cfm">
	</cfcase>
	<cfcase value="actionaddsubscriptionplan">
		<cfset request.stream="added a subscription plan">
		<cfinclude template="actions/addsubscriptionplan.cfm">
	</cfcase>
	<cfcase value="actioneditsubscriptionplan">
		<cfset request.stream="edited a subscription plan">
		<cfinclude template="actions/editsubscriptionplan.cfm">
	</cfcase>
	<cfdefaultcase>
		<cfset request.stream=0>
		<cfinclude template="layout/default.cfm">
	</cfdefaultcase>
</cfswitch>