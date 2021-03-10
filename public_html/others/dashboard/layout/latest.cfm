<cfoutput>
	<cftry>
		<cfinvoke component="#Application.objEvent#" method="getEvents" eventdsn="#client.siteurl#" status="Pending" returnVariable="pendingEvents">
		<cfinvoke component="#application.objimagegallery#" method="getAllImages" imagedsn="#client.siteurl#" imagestatus="Non-Active,Pending" returnvariable="pendingImages">	
		<cfinvoke component="#Application.objBlog#" method="getComments" ds="#client.siteurl#" blogcomment="1" status="Private" returnVariable="pendingBlogComments">
		<cfinvoke component="#application.objforum#" method="getPosts" ds="#client.siteurl#" approved="0" returnvariable="pendingForumPosts">
		<cfcatch type="database">
			<cfinvoke component="#application.objbuildtables#" method="createCommentTables" ds="#client.siteurl#">
			<cfinvoke component="#application.objbuildtables#" method="createBlogTables" ds="#client.siteurl#">
			<cfinvoke component="#application.objbuildtables#" method="createEventTables" ds="#client.siteurl#">
			<cfinvoke component="#application.objbuildtables#" method="createImageTables" ds="#client.siteurl#">
			<h1>There was an error, your site was missing database information. It has now been added to the site, please refresh this page.</h1>
		</cfcatch>
	</cftry>
		
	<cfset ContentWidth = 910>
	<cfset client.numofImages = 6>
	<cfset client.numofContacts = 10>
	<cfset client.width = 95>
	<cfset imagesPerRow = int((ContentWidth - 20)/client.width)>
	
	<cfparam name="#url.action#" default="albums">
	<div class="dashboard group">
		<cfswitch expression="#url.action#">
			<cfdefaultcase>
				<div id="main">
					<cfinclude template="../display/importantlinks.cfm">
					<cfif pendingBlogComments.recordcount gt 0 or pendingEvents.recordcount gt 0 or pendingImages.recordcount gt 0 or pendingForumPosts.recordcount gt 0>
						<div id="pending">
						<h2>Pending items for your site</h2>
						<cfif pendingBlogComments.recordcount gt 0>
							<cfinclude template="../display/pendingBlogComments.cfm">
						</cfif>
						<cfif pendingEvents.recordcount gt 0>
							<cfinclude template="../display/pendingEvents.cfm">
						</cfif>
						<cfif pendingImages.recordcount gt 0>
							<cfinclude template="../display/pendingImages.cfm">
						</cfif>
						<cfif pendingForumPosts.recordCount gt 0>
							<cfinclude template="../display/pendingForumPosts.cfm">
						</cfif>
						</div>
					</cfif>
					<cfinclude template="../display/latestActivity.cfm">
				</div>
				<div id="secondary">
					<h3>Recently Updated Contacts</h3>
					<div id="secondary-recentContacts">
						<cfinclude template="/others/dashboard/display/recentContacts.cfm">
					</div>
				</div>
			</cfdefaultcase>
		</cfswitch>
	</div>	
</cfoutput>