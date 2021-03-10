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
					<cfif client.roleid NEQ 7>
						<cfset mysiteids=client.allowedsites>
					<cfelse>
						<cfset mysiteids=0>
					</cfif>
					<cfswitch expression="#url.action#">
						<cfcase value="reportedincidents">
							<cfset statusid=0>
							<cfset headertext='Reported Incident'>
							<cfinclude template="showincidents.cfm">
						</cfcase>
						<cfcase value="incidentsinprocess">
							<cfset statusid=1>
							<cfset headertext='Incidents in Process'>
							<cfinclude template="showincidents.cfm">
						</cfcase>
						<cfcase value="resolvedincidents">
							<cfset statusid=2>
							<cfset headertext='Resolved incidents'>
							<cfinclude template="showincidents.cfm">
						</cfcase>
						<cfcase value="reportincident">
							<cfinclude template="reportincident.cfm">
						</cfcase>
						<cfcase value="showincident">
							<cfinclude template="showincident.cfm">
						</cfcase>
						<cfdefaultcase>
							<cflocation url="/cms/taskmgmt/troubleticket/reportedincidents" addtoken="false">
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