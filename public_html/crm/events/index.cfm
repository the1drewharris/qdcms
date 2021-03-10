<cfswitch expression="#url.action#">
	<cfcase value="actionaddevent">
		<cfset request.stream="added an event">
		<cfinclude template="actions/addeditevent.cfm">
	</cfcase>
	<cfcase value="actioneditevent">
		<cfset request.stream="edited an event">
		<cfinclude template="actions/addeditevent.cfm">
	</cfcase>
	<cfcase value="actionaddeventcategory">
		<cfset request.stream="added an event category">
		<cfinclude template="actions/addeventcategory.cfm">
	</cfcase>
	<cfcase value="actionediteventcategory">
		<cfset request.stream="edited an event category">
		<cfinclude template="actions/editeventcategory.cfm">
	</cfcase>
	<cfcase value="actionpendingevents">
		<cfset request.stream="deleted or approved pending events">
		<cfinclude template="actions/pendingevents.cfm">
	</cfcase>
	<cfcase value="deleteeventcategories">
		<cfset request.stream="deleted an event category">
		<cfinclude template="actions/deleteeventcategories.cfm">
	</cfcase>
	<cfcase value="deleteevent">
		<cfset request.stream="deleted an event">
		<cfinclude template="actions/deleteevent.cfm">
	</cfcase>
	<!--- for pop up confirm box --->
	<cfcase value="confirmdeleteevent">
		<cfset request.stream="confirmed deletion of an event">
		<cfinclude template="display/confirmdeleteevent.cfm">
	</cfcase>
	<!--- From here onwards, access only via ajax --->
	<cfcase value="geteventdata">
		<cfset request.stream=0>
		<cfinclude template="display/geteventdata.cfm">
	</cfcase>
	<cfcase value="geteventinfo">
		<cfset request.stream=0>
		<cfinclude template="display/eventinfo.cfm"> 
	</cfcase>
	<cfdefaultcase>
		<cfset request.stream=0>
		<cfinclude template="layout/default.cfm">
	</cfdefaultcase>
</cfswitch>