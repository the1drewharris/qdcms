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
					<cfinclude template="/display/errors.cfm">
					<cfswitch expression="#url.action#">
						<cfcase value="profile">
							<cfset action="Update Profile">
							<cfset formaction="actionupdateuserprofile">
							<cfinclude template="../includes/getuserinfo.cfm">
							<cfinclude template="updateuserprofile.cfm">
						</cfcase>
						<cfcase value="editsite">
							<cfset action="Edit Site">
							<cfset formaction="/cms/others/user/actionupdatesite">
							<cfinclude template="../includes/siteinfo.cfm">
							<cfinclude template="editsite.cfm">
						</cfcase>
						<cfcase value="profileupdated">
							<cfinclude template="profileupdated.cfm">
						</cfcase>
						<cfdefaultcase>
							<cflocation url="/cms/others/user/editprofile" addtoken="false">
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