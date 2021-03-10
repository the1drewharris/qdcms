<cfinclude template="display/menu.cfm">
<cfparam name="#url.action#" default="albums">

<cfswitch expression="#url.action#">
	<cfcase value="actionaddNewsletter">
		<cfif CGI.REMOTE_HOST NEQ "72.213.140.214">
				<cfset live=FALSE>
			<cfelse>
				<cfset live=TRUE>
			</cfif>
		<cfif live>
			<cfset request.stream="added a newsletter">
			<cfinclude template="/marketing/newsletter/actions/addnewsletter.cfm">
			<cflocation url="/cms/marketing/newsletter/" addToken="no"> 
		<cfelse>
			<h1>Currently Disabled</h1>
		</cfif>
		
		
	</cfcase>
	
	<cfcase value="actioneditNewsletter">
		<cfif CGI.REMOTE_HOST NEQ "72.213.140.214">
				<cfset live=FALSE>
			<cfelse>
				<cfset live=TRUE>
			</cfif>
		<cfif live>
			<cfset request.stream="edited a newsletter">
			<cfinclude template="/marketing/newsletter/actions/editnewsletter.cfm">
		<cflocation url="/cms/marketing/newsletter/" addToken="no"> 
		<cfelse>
			<h1>Currently Disabled</h1>
		</cfif>
		
		
	</cfcase>
			
	<cfcase value="delete">
		<cfinclude template="/marketing/newsletter/actions/deletenewsletter.cfm">
		<cflocation url="/cms/marketing/newsletter/" addToken="no">
	</cfcase>
	
	<cfcase value="restore">
		<cfinvoke component="#application.objnewsletter#" method="editNewsletter" ds="#client.siteurl#" newsletterid="#url.blogid#" status="Published" authorid="#client.masternameid#">
		<cflocation url="/cms/marketing/newsletter/" addToken="no"> 
	</cfcase>
	
	<cfcase value="copy">
		<cfinclude template="/marketing/newsletter/actions/copynewsletter.cfm">
		<cflocation url="/cms/marketing/newsletter" addToken="no">
	</cfcase>
	
	<cfcase value="copyTemplate">
		<cfinclude template="/marketing/newsletter/actions/copyTemplate.cfm">
		<cflocation url="/cms/marketing/newsletter/managetemplate" addToken="no">
	</cfcase>
	
	<cfcase value="deleteTemplate">
		<cfinclude template="/marketing/newsletter/actions/deleteTemplate.cfm">
		<cflocation url="/cms/marketing/newsletter/managetemplate" addToken="no">
	</cfcase>
	
	<cfcase value="imageBrowser">
		<cfinclude template="display/imageBrowser.cfm">
	</cfcase>
	
	<cfcase value="viewreport">
		<cfinclude template="display/report.cfm">
	</cfcase>
	
	<cfcase value="detailreport">
		<cfinclude template="display/detailreport.cfm">
	</cfcase>
	
	<cfcase value="downloadreport">
		<cfinclude template="/marketing/newsletter/actions/downloadreport.cfm">
	</cfcase>
	
	<cfdefaultcase>
			<cfinclude template="layout/default.cfm">
	</cfdefaultcase>
</cfswitch>