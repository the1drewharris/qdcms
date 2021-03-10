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
						<cfcase value="addfile">
							<cfset title="Add File">
							<cfset formaction="actionaddfile">
							<cfinclude template="addeditfile.cfm">
						</cfcase>
						<cfcase value="editfile">
							<cfset title="Edit File">
							<cfset formaction="actioneditfile">
							<cfinclude template="../includes/fileinfo.cfm">
							<cfinclude template="addeditfile.cfm">
						</cfcase>
						<cfcase value="showfiles">
							<cfinclude template="showfiles.cfm">
						</cfcase>
						<cfdefaultcase>
							<cflocation url="/cms/media/filemgmt/showfiles" addtoken="false"> 
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