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
			<div id="content-bg">
				<div id="content">
					<cfinclude template="../display/submenuNavigation.cfm">
					<cfinclude template="/display/errors.cfm">
					<cfswitch expression="#url.action#">
						<cfcase value="adduser">
							<cfset action="Add User">
							<cfset formaction="/cms/administration/users/adduseraction">
							<cfinclude template="addedituser.cfm">
						</cfcase>
						<cfcase value="edituser">
							<cfset action="Edit User">
							<cfset formaction="/cms/administration/users/edituseraction">
							<cfif NOT thereAreErrors>
								<cfinclude template="../includes/getuserinfo.cfm">
							</cfif>
							<cfinclude template="addedituser.cfm">
						</cfcase>
						<cfcase value="editpermission">
							<cfset formaction="/cms/administration/users/editpermissionaction">
							<cfinclude template="editpermission.cfm">
						</cfcase>
						<cfcase value="showusers">
							<cfinclude template="showusers.cfm">
						</cfcase>
						<cfdefaultcase>
							<cflocation url="/cms/administration/users/showusers" addtoken="false">
						</cfdefaultcase>
					</cfswitch>
				</div>
			</div>
			<div class="clear"></div>
			<cfinclude template="/display/footer.cfm">
		</body>
	</html>
</cfoutput>