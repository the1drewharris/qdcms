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
						<cfcase value="addsection">
							<cfset action="Add Section">
							<cfset formaction="/cms/administration/section/addsectionaction">
							<cfinclude template="addeditsection.cfm">
						</cfcase>
						<cfcase value="editsection">
							<cfset action="Edit Section">
							<cfset formaction="/cms/administration/section/editsectionaction">
							<cfif listlen(client.errorList) EQ 0>
								<cfinvoke component="#application.objqdsecurity#" method="getQdSections" sectionid="#url.sectionid#" returnvariable="thissection">
								<cfif thissection.recordcount GT 0>
									<cfinvoke component="#application.objqdsecurity#" method="getProductsaSectionBelongsto" sectionid="#thissection.sectionid#" returnvariable="products">
									<cfloop query="products">
										<cfset session.formValues['product#productid#']=productid>
									</cfloop>
									<cfset session.formValues['sectionid']=thissection.sectionid>
									<cfset session.formValues['sectionname']=thissection.section_name>
									<cfset session.formValues['description']=thissection.description>
								</cfif>
							</cfif>
							<cfinclude template="addeditsection.cfm">
						</cfcase>
						<cfcase value="showsections">
							<cfinclude template="showsections.cfm">
						</cfcase>
						<cfcase value="sortsections">
							<cfinclude template="sortsections.cfm">
						</cfcase>
						<cfcase value="sortmodules">
							<cfinclude template="sortmodules.cfm">
						</cfcase>
						<cfdefaultcase>
							<cflocation url="/cms/administration/section/showsections" addtoken="false">
						</cfdefaultcase>
					</cfswitch>
				</div>
			</div>
			<div class="clear"></div>
			<cfinclude template="/display/footer.cfm">
		</body>
	</html>
</cfoutput>