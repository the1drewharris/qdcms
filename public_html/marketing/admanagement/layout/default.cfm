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
						<cfcase value="addadvertisement">
							<cfset title="Add Advertisement">
							<cfset formaction="actionaddadvertisement">
							<cfinclude template="addeditadvertisement.cfm">
						</cfcase>
						<cfcase value="editadvertisement">
							<cfset title="Edit Advertisement">
							<cfset formaction="actioneditadvertisement">
							<cfif NOT thereAreErrors>
								<cfinclude template="../includes/adinfo.cfm">
							</cfif>
							<cfinclude template="addeditadvertisement.cfm">
						</cfcase>
						<cfcase value="advertisers">
							<cfinclude template="advertisers.cfm">
						</cfcase>
						<cfcase value="zones">
							<cfinclude template="zones.cfm">
						</cfcase>
						<cfcase value="advertiserdashboard">
							<cfinclude template="advertiserdashboard.cfm">
						</cfcase>
						<cfcase value="zonedashboard">
							<cfinclude template="zonedashboard.cfm">
						</cfcase>
						<cfcase value="showimpressions">
							<cfinclude template="showimpressions.cfm">
						</cfcase>
						<cfcase value="deletedads">
							<cfinclude template="deletedads.cfm">
						</cfcase>
						<cfdefaultcase>
							Welcome to ad management
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