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
					<cfinclude template="../display/searchform.cfm">
					<cfswitch expression="#url.action#">
						<cfcase value="addevent">
							<cfset title="Add Event">
							<cfset formaction="/cms/crm/events/actionaddevent">
							<cfinclude template="addeditevent.cfm">
						</cfcase>
						<cfcase value="editevent">
							<cfset title="Edit Event">
							<cfset formaction="/cms/crm/events/actioneditevent">
							<cfinclude template="../includes/eventinfo.cfm">
							<cfinclude template="addeditevent.cfm">
						</cfcase>
						<cfcase value="addeventcategory">
							<cfset title="Add Event Category">
							<cfset formaction="actionaddeventcategory">
							<cfinclude template="addediteventcategory.cfm">
						</cfcase>
						<cfcase value="editeventcategory">
							<cfset title="Edit Event Category">
							<cfset formaction="actionediteventcategory">
							<cfinclude template="../includes/eventcategoryinfo.cfm">
							<cfinclude template="addediteventcategory.cfm">
						</cfcase>
						<cfcase value="listcategories">
							<cfinclude template="categories.cfm">
						</cfcase>
						<cfcase value="pendingevents">
							<cfinclude template="pendingevents.cfm">
						</cfcase>
						<cfcase value="showevents">
							<cfinclude template="showevents.cfm">
						</cfcase>
						<cfcase value="listevents">
							<cfinclude template="listevents.cfm">
						</cfcase>
						<cfdefaultcase>
							<cflocation url="/cms/crm/events/showevents" addtoken="false">
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