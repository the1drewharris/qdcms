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
						<cfcase value="addwptemplate">
							<cfset formaction="actionaddwptemplate">
							<cfset title="Add Web Page Template">
							<cfinclude template="addeditwptemplate.cfm">
						</cfcase>
						<cfcase value="editwptemplate">
							<cfset formaction="actioneditwptemplate">
							<cfset title="Edit Web Page Template">
							<cfif NOT thereAreErrors>
								<cfinclude template="../includes/wptemplateinfo.cfm">
							</cfif>
							<cfinclude template="addeditwptemplate.cfm">
						</cfcase>
						<cfcase value="managewptemplates">
							<cfinclude template="managewptemplates.cfm">
						</cfcase>
						<cfcase value="addwebpage">
							<cfset formaction="actionaddwebpage">
							<cfset title="Add Web Page">
							<cfinclude template="addeditwebpage.cfm">
						</cfcase>
						<cfcase value="editwebpage">
							<cfset formaction="actioneditwebpage">
							<cfset title="Edit Web Page">
							<cfif NOT thereAreErrors>
								<cfinclude template="../includes/webpageinfo.cfm">
							</cfif>
							<cfinclude template="addeditwebpage.cfm">
						</cfcase>
						<cfcase value="viewwebpages">
							<cfinclude template="viewwebpages.cfm">
						</cfcase>
						<cfdefaultcase>
							<cflocation url="/cms/content/webpages/viewWebPages" addtoken="false">
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