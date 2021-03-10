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
						<cfcase value="showemailservers">
							<cfinclude template="showemailservers.cfm">
						</cfcase>
						<cfcase value="addemailserver">
							<cfset title="Add Email Server">
							<cfset formaction="actionaddemailserver">
							<cfinclude template="addeditemailserver.cfm">
						</cfcase>
						<cfcase value="editemailserver">
							<cfset title="Edit Email Server">
							<cfset formaction="actioneditemailserver">
							<cfinclude template="../includes/emailserverinfo.cfm">
							<cfinclude template="addeditemailserver.cfm">
						</cfcase>
						<cfdefaultcase>
							<cfinclude template="showemailservers.cfm">
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