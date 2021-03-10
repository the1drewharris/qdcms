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
					<cfswitch expression="#url.action#">
						<cfcase value="addrole">
							<cfinclude template="addeditrole.cfm">
						</cfcase>
						<cfcase value="editrole">
							<cfset action="Edit Security Role">
							<cfset formaction="/cms/administration/roles/editroleaction">
						
							<cfif client.errorList EQ "">
								<cfinvoke component="#application.objqdsecurity#" method="getSecurityRoles" roleid="#url.roleid#" returnvariable="thisSecurityRole">
								<cfinvoke component="#application.objqdsecurity#" method="getModulesInSecurityRole" roleid="#url.roleid#" returnvariable="mymodules">
								<cfset session.formValues['roleid']=thisSecurityRole.roleid>
								<cfset session.formValues['securityrole']=thisSecurityRole.securityrole>
								<cfset session.formValues['description']=thisSecurityRole.description>
								<cfloop query="mymodules">
									<cfset session.formValues['module#moduleid#']=moduleid>
								</cfloop>
							</cfif>
							<cfinclude template="addeditrole.cfm">
						</cfcase>
						<cfcase value="showroles">
							<cfinclude template="showroles.cfm">
						</cfcase>
						<cfdefaultcase>
							<cflocation url="/cms/administration/roles/showroles" addtoken="false">
						</cfdefaultcase>
					</cfswitch>
				</div>
			</div>
			<div class="clear"></div>
			<cfinclude template="/display/footer.cfm">
		</body>
	</html>
</cfoutput>