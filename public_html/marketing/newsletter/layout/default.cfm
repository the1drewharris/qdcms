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
						<cfcase value="shownewsletters">
							<cfinclude template="shownewsletters.cfm">
						</cfcase>
						<cfcase value="addnewsletter">
							<cfset title="Add Newseltter">
							<cfset formaction="actionaddnewsletter">
							<cfinclude template="addeditnewsletter.cfm">
						</cfcase>
						<cfcase value="editnewsletter">
							<cfset title="Edit Newsletter">
							<cfset formaction="actioneditnewsletter">
							<cfinclude template="../includes/newsletterinfo.cfm">
							<cfinclude template="addeditnewsletter.cfm">
						</cfcase>
						<cfcase value="managetemplates">
							<cfinclude template="manageTemplates.cfm">
						</cfcase>
						<cfcase value="addnewslettertemplate">
							<cfset title="Add Newsletter Template">
							<cfset formaction="actionaddnewslettertemplate">
							<cfinclude template="addeditnewslettertemplate.cfm">
						</cfcase>
						<cfcase value="editnewslettertemplate">
							<cfset title="Edit Newsletter Template">
							<cfset formaction="actioneditnewslettertemplate">
							<cfinclude template="../includes/templateinfo.cfm">
							<cfinclude template="addeditnewslettertemplate.cfm">
						</cfcase>
						<cfcase value="viewreport">
							<cfinclude template="viewreport.cfm">
						</cfcase>
						<cfcase value="detailreport">
							<cfinclude template="detailreport.cfm">
						</cfcase>
						<cfdefaultcase>
							<cflocation url="/cms/marketing/newsletter/shownewsletters" addtoken="false">
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