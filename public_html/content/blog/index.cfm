<cfinclude template="includes/blogsecuritylayer.cfm">
<cfswitch expression="#url.action#">
	<cfcase value="setAuthor">
		<cfset request.stream="set the author">
		<cfinclude template="actions/setauthor.cfm">
	</cfcase>
	<cfcase value="actionAddBlog">
		<cfset request.stream="added a blog">
		<cfinclude template="actions/actionaddblog.cfm">
	</cfcase>
	<cfcase value="actionEditblog">
		<cfset request.stream="edited blog">
		<cfinclude template="actions/actioneditblog.cfm">
	</cfcase>
	<cfcase value="actionAddBlogCategory">
		<cfset request.stream="added blog category">
		<cfinclude template="actions/actionaddblogcat.cfm">
	</cfcase>
	<cfcase value="actionEditBlogCategory">
		<cfset request.stream="edited blog category">
		<cfinclude template="actions/actioneditblogcat.cfm">
	</cfcase>
	<cfcase value="actionAddBlogEntry">
		<cfset request.stream="added a blog entry">
		<cfinclude template="actions/actionaddentry.cfm">
	</cfcase>
	<cfcase value="actionEditBlogEntry">
		<cfset request.stream="edited a blog entry">
		<cfinclude template="actions/actioneditentry.cfm">
	</cfcase>
	<cfcase value="copyblogentry">
		<cfset request.stream="copied blog entry/entries">
		<cfinclude template="actions/copyblogentry.cfm">
	</cfcase>
	<cfcase value="restoreblogentry">
		<cfset request.stream="restored a blog entry">
		<cfinclude template="actions/restoreblogentry.cfm">
	</cfcase>
	<cfcase value="deleteblogEntry">
		<cfset request.stream="deleted a blog entry">
		<cfinclude template="actions/deleteblogentry.cfm">		
	</cfcase>
	<cfcase value="updateblogcomment">
		<cfset request.stream="updated a blog comment">
		<cfinclude template="actions/updatecomment.cfm">
	</cfcase>
	<cfcase value="deleteBlog">
		<cfset request.stream="deleted a blog">
		<cfinclude template="actions/deleteblog.cfm">
	</cfcase>
	<cfcase value="restoreblog">
		<cfset request.stream="restored a blog">
		<cfinclude template="actions/restoreblog.cfm">
	</cfcase>
	<cfcase value="deleteblogCategory">
		<cfset request.stream="deleted a blog category">
		<cfinclude template="actions/deleteblogcategory.cfm">
	</cfcase>
	<cfcase value="restoreblogCategory">
		<cfset request.stream="restored a blog category">
		<cfinclude template="actions/restoreblogcategory.cfm">
	</cfcase>
	<cfcase value="imagebrowser">
		<cfset request.stream=0>
		<cfinclude template="/media/imagemgmt/actions/imageBrowser.cfm">
	</cfcase>
	<cfdefaultcase>
		<cfset request.stream=0>
		<cfinclude template="layout/default.cfm">
	</cfdefaultcase>
</cfswitch>