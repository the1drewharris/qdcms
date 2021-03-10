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
						<cfcase value="showalbums">
							<cfinclude template="showalbums.cfm">
						</cfcase>
						<cfcase value="viewalbum">
							<cfinclude template="viewalbum.cfm">
						</cfcase>
						<cfcase value="addalbum">
							<cfset title="Add Album">
							<cfset formaction="actionaddalbum">
							<cfinclude template="addeditalbum.cfm">
						</cfcase>
						<cfcase value="editalbum">
							<cfset title="Edit Album">
							<cfset formaction="actioneditalbum">
							<cfinclude template="../includes/galleryinfo.cfm">
							<cfinclude template="addeditalbum.cfm">
						</cfcase>
						<cfcase value="editimage">
							<cfset title="Edit Image">
							<cfset formaction="actioneditimage">
							<cfinclude template="../includes/imageinfo.cfm">
							<cfinclude template="editimage.cfm">
						</cfcase>
						<cfcase value="images">
							<cfinclude template="showimages.cfm">
						</cfcase>
						<cfcase value="pendingimages">
							<cfinclude template="pendingimages.cfm">
						</cfcase>
						<cfdefaultcase>
							<cflocation url="/cms/#url.section#/#url.module#/showalbums/" addtoken="false">
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