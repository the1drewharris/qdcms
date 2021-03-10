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
						<cfcase value="showhauoptions">
							<cfinclude template="showhauoptions.cfm">
						</cfcase>
						<cfcase value="addhauoption">
							<cfset title="Add HAU Option">
							<cfset formaction="actionaddhauoption">
							<cfinclude template="addedithauoption.cfm">
						</cfcase>
						<cfcase value="edithauoption">
							<cfset title="Edit HAU Option">
							<cfset formaction="actionedithauoption">
							<cfif NOT thereAreErrors>
								<cfinclude template="../includes/hauoptioninfo.cfm">
							</cfif>
							<cfinclude template="addedithauoption.cfm">
						</cfcase>
						<cfcase value="showevents">
							<cfinclude template="events.cfm">
						</cfcase>
						<cfcase value="hautoevent">
							<cfinclude template="hautoevent.cfm">
						</cfcase>
						<cfcase value="showreport">
							<cfinclude template="report.cfm">
						</cfcase>
						<cfdefaultcase>
							<cflocation url="/cms/marketing/heardaboutus/showhauoptions" addtoken="false">
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