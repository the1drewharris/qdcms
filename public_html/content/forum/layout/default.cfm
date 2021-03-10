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
					<cfinclude template="../display/submenuNavigation.cfm">
					<cfinclude template="/display/errors.cfm">
					<cfinclude template="../display/searchform.cfm">
					<cfswitch expression="#url.action#">
						<cfcase value="addforum,editforum">
							<cfinclude template="addeditforum.cfm">
						</cfcase>
						<cfcase value="showforums">
							<cfinclude template="showforums.cfm">
						</cfcase>
						<cfcase value="showsubforums">
							<cfinclude template="showsubforums.cfm">
						</cfcase>
						<cfcase value="showtopics">
							<cfinclude template="showtopics.cfm">
						</cfcase>
						<cfcase value="showposts">
							<cfinclude template="showposts.cfm">
						</cfcase>
						<cfcase value="editpost">
							<cfinclude template="editPost.cfm">
						</cfcase>
						<cfcase value="edittopic">
							<cfinclude template="editTopic.cfm">
						</cfcase>
						<cfcase value="deletedposts">
							<cfinclude template="deletedposts.cfm">
						</cfcase>
						<cfcase value="deletedtopics">
							<cfinclude template="deletedtopics.cfm">
						</cfcase>
						<cfcase value="deletedforums">
							<cfinclude template="deletedforums.cfm">
						</cfcase>
						<cfcase value="moveforums,movetopics,moveposts">
							<cfinclude template="moveto.cfm">
						</cfcase>
						<cfcase value="viewpost">
							<cfinclude template="viewpost.cfm">
						</cfcase>
						<cfcase value="reportedposts">
							<cfinclude template="reportedposts.cfm">
						</cfcase>
						<cfcase value="unapprovedposts">
							<cfinclude template="unapprovedposts.cfm">
						</cfcase>
						<cfdefaultcase>
							<cflocation url="/cms/#url.section#/#url.module#/showforums" addtoken="false">
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