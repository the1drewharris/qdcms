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
						<cfcase value="addnewsite">
							<cfset action="Add New Site">
							<cfset formaction="/cms/administration/site/addnewsiteaction">
							<cfinclude template="addeditsite.cfm">
						</cfcase>
						<cfcase value="editsite">
							<cfset action="Edit Site">
							<cfset formaction="/cms/administration/site/editsiteaction">
							<cfinclude template="../includes/siteinfo.cfm">
							<cfinclude template="addeditsite.cfm">
						</cfcase>
						<cfcase value="showsites">
							<cfset action="List of Sites">
							<cfinclude template="showsites.cfm">
						</cfcase>
						<cfdefaultcase>
							<cflocation url="/cms/#url.section#/#url.module#/showsites" addtoken="false">
						</cfdefaultcase>
					</cfswitch>
				</div>
			</div>
			<div class="clear"></div>
			<cfinclude template="/display/footer.cfm">
		</body>
	</html>
</cfoutput>