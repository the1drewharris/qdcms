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
						<cfcase value="showactive">
							<cfinclude template="showactive.cfm">
						</cfcase>
						<cfcase value="showinactive">
							<cfinclude template="showinactive.cfm">
						</cfcase>
						<cfcase value="subscriptionplans">
							<cfinclude template="subscriptionplans.cfm">
						</cfcase>
						<cfcase value="showhistory">
							<cfinclude template="showhistory.cfm">
						</cfcase>
						<cfcase value="addsubscriptionplan">
							<cfset title="Add Subscription Plan">
							<cfset formaction="actionaddsubscriptionplan">
							<cfinclude template="addeditsubscriptionplan.cfm">
						</cfcase>
						<cfcase value="editsubscriptionplan">
							<cfset title="Edit Subscription Plan">
							<cfset formaction="actioneditsubscriptionplan">
							<cfinclude template="../includes/subscriptionplaninfo.cfm">
							<cfinclude template="addeditsubscriptionplan.cfm">
						</cfcase>
						<cfcase value="setprice">
							<cfset title="Set Subscription Price">
							<cfset formaction="actionsetprice">
							<cfinclude template="setprice.cfm">
						</cfcase>
						<cfdefaultcase>
							<cfinclude template="showactive.cfm">
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