<cfswitch expression="#url.action#">
    <cfcase value="states">
		<cfinclude template="layout/states_json.cfm">
	</cfcase>
	<cfcase value="actionaddcontact">
		<cfset request.stream="added a contact">
		<cfinclude template="actions/addcontact.cfm">
	</cfcase>
	<cfcase value="actioneditcontact">
		<cfset request.stream="edited a contact">
		<cfinclude template="actions/editcontact.cfm">
	</cfcase>
	<cfcase value="actionaddgroup">
		<cfset request.stream="added a group">
		<cfinclude template="actions/addgroup.cfm">
	</cfcase>
	<cfcase value="actioneditgroup">
		<cfset request.stream="edited a group">
		<cfinclude template="actions/editgroup.cfm">
	</cfcase>
	<cfcase value="actionadvancedsearch">
		<cfset request.stream="executed an advanced search">
		<cfinclude template="actions/advancedsearch.cfm">
	</cfcase>
	<cfcase value="actionfindduplicates">
		<cfset request.stream="used the find duplicates feature">
		<cfinclude template="actions/findduplicates.cfm">
	</cfcase>
	<cfcase value="actionuploadcontacts">
		<cfset request.stream="uploaded contacts">
		<cfinclude template="actions/uploadcontacts.cfm">
	</cfcase>
	<cfcase value="exportfields">
		<cfset request.stream="selected fields for an export of contacts">
		<cfinclude template="display/exportfields.cfm">
	</cfcase>
	<cfcase value="actionexportcontacts,exportcontacts">
		<cfset request.stream="exported contacts">
		<cfinclude template="actions/exportcontacts.cfm">
	</cfcase>
	<cfcase value="actiondeletegroup">
		<cfset request.stream="deleted a group">
		<cfinclude template="actions/deletegroup.cfm">
	</cfcase>
	<cfcase value="actionaddnotes">
		<cfset request.stream="added a note to a contact">
		<cfinclude template="actions/addnotes.cfm">
	</cfcase>
	<cfcase value="actioneventgroups">
		<cfset request.stream="viewed the event groups for a contact">
		<cfinclude template="actions/eventgroups.cfm">
	</cfcase>
	<cfcase value="deletecontacts">
		<cfset request.stream="deleted contact(s)">
		<cfinclude template="actions/deletecontacts.cfm">
	</cfcase>
	<cfcase value="restorecontacts">
		<cfset request.stream="restored contacts">
		<cfinclude template="actions/restorecontacts.cfm">
	</cfcase>
	<cfcase value="actioneditreview">
		<cfset request.stream="edited a review for a contact">
		<cfinclude template="actions/editreview.cfm">
	</cfcase>
	<cfcase value="deletereview">
		<cfset request.stream="deleted a review for a contact">
		<cfinclude template="actions/deletereview.cfm">
	</cfcase>
	<cfcase value="saveselected">
		<cfset request.stream="saved selected contacts">
		<cfinclude template="actions/saveselected.cfm">
	</cfcase>
	<cfcase value="actioncopycontacts">
		<cfset request.stream="copied contacts to a group">
		<cfinclude template="actions/copycontacts.cfm">
	</cfcase>
	<cfcase value="actionaddtoaddressbook">
		<cfset request.stream="imported contacts">
		<cfinclude template="actions/addtoaddressbook.cfm">
	</cfcase>
	<cfcase value="makevcard">
		<cfset request.stream="created/downloaded a vcard">
		<cfinclude template="actions/vcard.cfm">
	</cfcase>
	<cfcase value="viewmap">
		<cfset request.stream="viewed the map of a contact">
		<cfinclude template="display/viewmap.cfm">
	</cfcase>
	<cfdefaultcase>
		<cfset request.stream=0>
		<cfinclude template="layout/default.cfm">
	</cfdefaultcase>
</cfswitch>