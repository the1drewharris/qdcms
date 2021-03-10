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
						<cfcase value="addcontest">
							<cfset formaction="actionaddcontest">
							<cfset title="Add Contest">
							<cfinclude template="frmAddEditContest.cfm">
						</cfcase>
						<cfcase value="editcontest">
							<cfset formaction="actioneditcontest">
							<cfset title="Edit Contest">
							<cfinclude template="../includes/contestinfo.cfm">
							<cfinclude template="frmAddEditContest.cfm">
						</cfcase>
						<cfcase value="showentries">
							<cfinclude template="showentries.cfm">
						</cfcase>
						<cfcase value="showcontests">
							<cfinclude template="showcontests.cfm">
						</cfcase>
						<cfdefaultcase>
							<cflocation url="/cms/content/contest/showcontests" addtoken="false">
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