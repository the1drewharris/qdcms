<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<cfoutput>
	<html xmlns="http://www.w3.org/1999/xhtml">
		<head>
			<cfinclude template="/includes/titleAndMeta.cfm">
			<cfinclude template="/includes/selectivecss.cfm">
		</head>
		<body>
			<cfinclude template="/display/header.cfm">
			<div class="clear"></div>
			<div id="content-bg">
				<div id="content">
					<cfinclude template="../display/submenuNavigation.cfm">
					<cfinclude template="/display/errors.cfm">
					<cfswitch expression="#url.action#">
						<cfcase value="addcontact">
							<cfset title="Add Contact">
							<cfset formaction="actionaddcontact">
							<cfinclude template="addeditcontact.cfm">
						</cfcase>
						<cfcase value="editcontact">
							<cfset title="Edit Contact">
							<cfset formaction="actioneditcontact">
							<cfinclude template="../includes/contactinfo.cfm">
							<cfinclude template="addeditcontact.cfm">
						</cfcase>
						<cfcase value="addgroup">
							<cfset title='Add Group'>
							<cfset formaction="actionaddgroup">
							<cfinclude template="addeditgroup.cfm">
						</cfcase>
						<cfcase value="editgroup">
							<cfset title="Edit Group">
							<cfset formaction="actioneditgroup">
							<cfinclude template="../includes/groupinfo.cfm">
							<cfinclude template="addeditgroup.cfm">
						</cfcase>
						<cfcase value="notes">
							<cfset title="Notes on:">
							<cfset formaction='actionaddnotes'>
							<cfinclude template="notes.cfm">
						</cfcase>
						<cfcase value="advancedsearch">
							<cfinclude template="advancedsearch.cfm">
						</cfcase>
						<cfcase value="uploadcontacts">
							<cfinclude template="uploadcontacts.cfm">
						</cfcase>
						<cfcase value="addtoaddressbook">
							<cfinclude template="addtoaddressbook.cfm">
						</cfcase>
						<cfcase value="exportcontacts">
							<cfinclude template="exportcontacts.cfm">
						</cfcase>
						<cfcase value="findduplicates">
							<cfinclude template="findduplicates.cfm">
						</cfcase>
						<cfcase value="showgroups">
							<cfinclude template="showgroups.cfm">
						</cfcase>
						<cfcase value="showcontacts">
							<cfinclude template="showcontacts.cfm">
						</cfcase>
						<cfcase value="eventgroups">
							<cfinclude template="eventgroups.cfm">
						</cfcase>
						<cfcase value="reviews">
							<cfinclude template="reviews.cfm">
						</cfcase>
						<cfcase value="editreview">
							<cfset formaction="actioneditreview">
							<cfset title="Edit Review">
							<cfinclude template="editreview.cfm">
						</cfcase>
						<cfdefaultcase>
							<cfinclude template="showcontacts.cfm">
						</cfdefaultcase>
					</cfswitch>
				</div>
			</div>
			<div class="clear"></div>
			<cfinclude template="/display/footer.cfm">
			<cfinclude template="/includes/selectivejs.cfm">
		</body>
	</html>
</cfoutput>