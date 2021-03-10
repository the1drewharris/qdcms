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
					<cfswitch expression="#url.action#">
						<cfcase value="addmodule">
							<cfset action="Add Module">
							<cfset formaction="/cms/administration/module/addmoduleaction">
							<cfinclude template="/administration/module/layout/addeditmodule.cfm">
						</cfcase>
						<cfcase value="editmodule">
							<cfset action="Edit Module">
							<cfset formaction="/cms/administration/module/editmoduleaction">
							<cfif listlen(client.errorList) EQ 0>
								<cfinvoke component="#application.objqdsecurity#" method="getQdModules" moduleid="#url.moduleid#" returnvariable="thismodule">
								<cfif thismodule.recordcount GT 0>
									<cfinvoke component="#application.objqdsecurity#" method="getSectionsaModuleBelongsTo" moduleid="#thismodule.moduleid#" returnvariable="sections">
									<cfloop query="sections">
										<cfset session.formValues['section#sectionid#']=sectionid>
									</cfloop>
									<cfset session.formValues['moduleid']=thismodule.moduleid>
									<cfset session.formValues['modulename']=thismodule.module_name>
									<cfset session.formValues['caption']=thismodule.caption>
									<cfset session.formValues['description']=thismodule.description>
								</cfif>
							</cfif>
							<cfinclude template="/administration/module/layout/addeditmodule.cfm">
						</cfcase>
						<cfcase value="showmodule">
							<cfinclude template="/administration/module/layout/showmodule.cfm">
						</cfcase>
						<cfdefaultcase>
							<cflocation url="/cms/administration/module/showmodule" addtoken="false">
						</cfdefaultcase>
					</cfswitch>
				</div>
			</div>
			<div class="clear"></div>
			<cfinclude template="/display/footer.cfm">
		</body>
	</html>
</cfoutput>