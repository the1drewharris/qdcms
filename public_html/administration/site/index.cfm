<cfswitch expression="#url.action#">
	<cfcase value="selectsiteaction">
		<cfset request.stream="selected a site">
		<cfinclude template="actions/selectsiteaction.cfm">
	</cfcase>
	<cfcase value="addnewsiteaction">
		<cfset request.stream="added a new site">
		<cfinclude template="actions/addnewsiteaction.cfm">
	</cfcase>
	<cfcase value="editsiteaction">
		<cfset request.stream="edited a site">
		<cfinclude template="actions/editsiteaction.cfm">
	</cfcase>
	<cfcase value="convertsite">
		<cfset request.stream="converted a site">
		<cfinclude  template="actions/convertsite.cfm">
	</cfcase>
	<cfdefaultcase>
		<cfset request.stream=0>
		<cfinclude template="layout/default.cfm">
	</cfdefaultcase>
</cfswitch>