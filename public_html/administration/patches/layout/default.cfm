<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<cfoutput>
	<html xmlns="http://www.w3.org/1999/xhtml">
		<head>
			<cfinclude template="/includes/titleAndMeta.cfm">
			<cfinclude template="/includes/selectivecss.cfm">
			<cfinclude template="/includes/selectivejs.cfm">
		</head>
		<body>
			<cfinclude template="/display/header.cfm">
			<div class="clear"></div>
			<div id="content-bg">
				<div id="content">
					<cfinclude template="../display/submenuNavigation.cfm">
					<cfinclude template="/display/errors.cfm">
					<cfswitch expression="#url.action#">
						<cfcase value="addpatch">
							<cfset title="Add Patch">
							<cfset formaction="addpatchaction">
							<cfinclude template="addeditpatch.cfm">
						</cfcase>
						<cfcase value="editpatch">
							<cfset title="Edit Patch">
							<cfset formaction="editpatchaction">
							<cfinclude template="../includes/patchinfo.cfm">
							<cfinclude template="addeditpatch.cfm">
						</cfcase>
						<cfcase value="sitereport">
							<cfinclude template="sitereport.cfm">
						</cfcase>
						<cfcase value="patchreport">
							<cfinclude template="patchreport.cfm">
						</cfcase>
						<cfdefaultcase>
							<cfinclude template="showpatches.cfm">
						</cfdefaultcase>
					</cfswitch>
				</div>
			</div>
			<div class="clear"></div>
			<cfinclude template="/display/footer.cfm">
		</body>
	</html>
</cfoutput>