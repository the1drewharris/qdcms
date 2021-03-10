<cfswitch expression="#url.action#">
	<cfcase value="actionupdateuserprofile">
		<cfinclude template="actions/updateuserprofile.cfm">
	</cfcase>
	<cfcase value="actionupdatesite">
		<cfinclude template="actions/updatesite.cfm">
	</cfcase>
	<cfdefaultcase>
		<cfinclude template="layout/default.cfm">
	</cfdefaultcase>
</cfswitch>