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
						<cfcase value="viewBlogs">
							<cfinclude template="frmViewBlogs.cfm">
						</cfcase>
						<cfcase value="viewBlogCategories">
							<cfinclude template="frmViewBlogCats.cfm">
						</cfcase>
						<cfcase value="viewBlogEntries">
							<cfinclude template="frmViewEntries.cfm">
						</cfcase>
						<cfcase value="viewBlogComments">
							<cfinclude template="frmViewComments.cfm">
						</cfcase>
						<cfcase value="viewPendBlogComments">
							<cfinclude template="frmViewPendComments.cfm">
						</cfcase>
						<cfcase value="addBlog">
							<cfset formaction="/cms/content/blog/actionAddblog">
							<cfset formtitle="Blog">
							<cfset title="Add Blog">
							<cfinclude template="frmAddEditBlognCat.cfm">
						</cfcase>
						<cfcase value="editBlog">
							<cfset formaction="/cms/content/blog/actionEditblog">
							<cfset formtitle="Blog">
							<cfset title="Edit Blog">
							<cfinclude template="../includes/bloginfo.cfm">
							<cfinclude template="frmAddEditBlognCat.cfm">
						</cfcase>
						<cfcase value="addBlogCategory">
							<cfset formaction="/cms/content/blog/actionAddBlogCategory">
							<cfset formtitle="Category">
							<cfset title="Add Blog Category">	
							<cfinclude template="frmAddEditBlognCat.cfm">	
						</cfcase>
						<cfcase value="editBlogCategory">
							<cfset formaction="/cms/content/blog/actionEditBlogCategory">
							<cfset formtitle="Category">
							<cfset title="Edit Blog Category">
							<cfinclude template="../includes/blogcategoryinfo.cfm">
							<cfinclude template="frmAddEditBlognCat.cfm">		
						</cfcase>
						<cfcase value="addBlogEntry">
							<cfset title="Add Blog Entry">
							<cfset formaction="/cms/content/blog/actionAddBlogEntry">
							<cfinclude template="frmAddEditEntry.cfm">
						</cfcase>
						<cfcase value="editBlogEntry">
							<cfset title="Edit Blog Entry">
							<cfset formaction = "/cms/content/blog/actionEditBlogEntry">
							<cfinclude template="../includes/blogentryinfo.cfm">
							<cfinclude template="frmAddEditEntry.cfm">
						</cfcase>
						<cfdefaultcase>
							<cflocation url="/cms/content/blog/viewBlogEntries" addtoken="false">
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