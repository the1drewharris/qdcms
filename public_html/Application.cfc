<cfcomponent displayname="Application" output="true" hint="Handle the application.">
	<cfset this.mappings["/mymap"] = '/home/drew/customtags/tags'>
	<cfset this.customTagPaths = '/home/drew/customtags/tags'> 
	<cfset this.name=ReplaceNoCase(CGI.SERVER_NAME, "www.", "", "ALL")>
	<cfset this.applicationTimeout = createTimeSpan(0,0,0,0)>
	<cfset this.clientManagement = true>
	<cfset this.sessionManagement = true>
	<cfset this.sessionTimeout = createTimeSpan(0,0,120,0)>
	<cfset this.setClientCookies = true>
	<cfset this.setDomainCookies = false>
	<cfset this.scriptProtect = false>     
     
	<cffunction name="onApplicationStart" returnType="void" output="false">
		<cfset Application.thisSite=this.name>
		<cfset Application.dsn=this.name>
		<cfset Application.productid=1>
		<cfset Application.fileaccesslist="">
		<cfset Application.googleapikey="ABQIAAAAoEU9NPlfrDljn6aK9AeyRBQUVH6jbOUQIWrGgdDlXZS1qX3i-xQaEhaAqBIuOPFIRXoU0dHEwCueQw">
		<cfset Application.basepath="/home/drew/domains">
		<cfset Application.rootfolder="#Application.basepath#/#this.name#/public_html">
		<cfset Application.fckeditor=createObject("component","/fckeditor/fckeditor")>
		<cfset Application.fckeditor.ToolbarSet="qdelta">
		<cfset Application.fckeditor.config.SkinPath="/fckeditor/skins/qdcms/">
		<cfset Applicaiton.fckEditor.config.BrowserContextMenuOnCtrl = true>
		<cfset Applicaiton.fckEditor.config.LinkBrowser = false>
		<cfset Application.fckEditor.height='350'>
		<cfset Application.fckEditor.config.ImageBrowserURL = '/media/imagemgmt/actions/imageBrowser.cfm'>
		<cfset Application.fckEditor.config.LinkUpload = false>
		<cfset Application.fckEditor.config.ImageBrowser = true>
		<cfset Application.fckEditor.config.ImageUpload = false>
		<cfset Application.fckEditor.config.FlashBrowser = false>
		<cfset Application.fckEditor.config.FlashUpload = false>
		<cfobject component="site" name="Application.objsite">
		<cfobject component="qdDataMgr" name="application.objqddatamgr">
		<cfobject component="tracking" name="application.objtracking">
		<cfobject component="imagegallery-beta" name="application.objimagegallery">
		<cfobject component="videolib" name="application.objvideolib">
		<cfobject component="timeDateConversion" name="application.objtimedateconversion">
		<cfobject component="navigation" name="application.objnavigation">
		<cfobject component="addressbook-beta" name="application.abCFC">
		<cfobject component="newsletter-beta" name="application.objnewsletter">
		<cfobject component="textconversions" name="application.objtextconversion">
		<cfobject component="bloggin" name="application.objblog">
		<cfobject component="webpage-beta" name="application.objwebpage">
		<cfobject component="qdsecurity" name="application.objqdsecurity">
		<cfobject component="security" name="application.objsecurity">
		<cfobject component="buildtables" name="application.objbuildtables">
		<cfobject component="events-beta" name="application.objevent">
		<cfobject component="pagination" name="application.objpagination">
		<cfobject component="comments" name="application.objcomments">
		<cfobject component="forum" name="application.objforum">
		<cfobject component="survey" name="application.objsurvey">
		<cfobject component="contest" name="application.objcontest">
		<cfobject component="links" name="application.objlinks">
		<cfobject component="file" name="application.objfile">
		<cfobject component="incident" name="application.objincident">
		<cfobject component="taskmanagement" name="application.objtaskmanagement">
		<cfobject component="admanagement" name="application.objadmanagement">
		<cfobject component="hau-beta" name="application.objhau">
		<cfobject component="patch" name="application.objpatch">
		<cfobject component="review" name="application.objreview">
		<cfobject component="product-beta" name="application.objproduct">
		<cfobject component="subscription" name="application.objsubscription">
		<cfobject component="newcart" name="application.objnewcart">
		<cfobject component="latlon" name="application.objlatlon">
		<cfset application.objpatch.init()>
		<cfinvoke component="#Application.abCFC#" method="getStates" returnVariable="application.states">
		<cfinvoke component="#Application.abCFC#" method="getCountries" returnVariable="application.countries">		
		<cfset Application.fileaccesslist=listAppend(Application.fileaccesslist,"#Application.rootfolder#/content/blog/actions/publish.cfm")>
		<cfset Application.fileaccesslist=listAppend(Application.fileaccesslist,"#Application.rootfolder#/media/imagemgmt/actions/imageBrowser.cfm")>
		<cfset Application.fileaccesslist=listAppend(Application.fileaccesslist,"#Application.rootfolder#/media/imagemgmt/actions/searchAlbums.cfm")>
		<cfset Application.fileaccesslist=listAppend(Application.fileaccesslist,"#Application.rootfolder#/media/imagemgmt/actions/searchImages.cfm")>
		<cfset Application.fileaccesslist=listAppend(Application.fileaccesslist,"#Application.rootfolder#/marketing/newsletter/actions/sendnewsletter.cfm")>
		<cfset Application.fileaccesslist=listAppend(Application.fileaccesslist,"#Application.rootfolder#/crm/events/includes/getinfo.cfm")>
		<cfset Application.fileaccesslist=listAppend(Application.fileaccesslist,"#Application.rootfolder#/crm/events/display/eventdetail.cfm")>
		<cfset Application.fileaccesslist=listAppend(Application.fileaccesslist,"#Application.rootfolder#/media/imagemgmt/actions/uploadimage.cfm")>
		<cfset Application.fileaccesslist=listAppend(Application.fileaccesslist,"#Application.rootfolder#/media/videomgmt/actions/runtime.cfm")>
		<cfset Application.fileaccesslist=listAppend(Application.fileaccesslist,"#Application.rootfolder#/administration/patches/patchfiles/JBFImport.cfm")>
		<cfset Application.fileaccesslist=listAppend(Application.fileaccesslist,"#Application.rootfolder#/marketing/newsletter/actions/templateXML.cfm")>
		<cfset Application.fileaccesslist=listAppend(Application.fileaccesslist,"#Application.rootfolder#/content/webpages/actions/templateXML.cfm")>
		<cfset Application.fileaccesslist=listAppend(Application.fileaccesslist,"#Application.rootfolder#/layout/accessdenied.cfm")>
		<cfset Application.fileaccesslist=listAppend(Application.fileaccesslist,"#Application.rootfolder#/media/imagemgmt/actions/searchAlbums.cfm")>
		<cfset Application.fileaccesslist=listAppend(Application.fileaccesslist,"#Application.rootfolder#/sandbox/allTests.cfm")>
		<cfset Application.masterdsn="deltasystem">
		<cfset Application.pathofindex="#Application.rootfolder#/index.cfm">
		<cfset Application.fckimagebrowser='http://#this.name#/fckeditor/editor/dialog/fck_image.html'>
		<cfset Application.imageThumbHeightList="112,60,90,300,500"> <!--- later, this info should come from siteinfo --->
		<cfset Application.imageThumbWidthList="122,60,90,300,500"> <!--- later, this info should come from siteinfo --->
		<cfset Application.imagethumbs="qdcms,tiny,small,large,detail">
		<cfset Application.allowedimagetypes="jpg,jpeg,gif,png,bmp,">
		<cfset Application.strExpires=GetHttpTimeString(Now()+1)>
	</cffunction>
	
	<cffunction name="onSessionStart" returntype="void" output="false">
		<cfset client.authenicated=0>
		<cfset client.masternameid=0>
		<cfset client.firstname="">
		<cfset client.lastname="">
		<cfset client.pagetogo="">
		<cfset client.errorlist="">
		<cfset client.message="">
		<cfset client.siteid=0>
		<cfset client.siteurl=0>
		<cfset client.roleid=0>
		<cfset client.allowedsites=-1>
		<cfset session.acl=structNew()>
		<cfset session.myNav="">
		<cfset session.defaultimagegallery="">
		<cfset client.dashboardallowed=FALSE>
	</cffunction>
	
	<cffunction name="OnRequest" access="public" returntype="void" output="true" hint="Fires after pre page processing is complete."> 
		<cfargument name="targetPage" type="string" required="true" />
		<cfparam name="url.section" default="0">
		<cfparam name="url.module" default="0">
		<cfparam name="url.action" default="0">
		<cfparam name="request.rootdir" default="">
		<cfparam name="request.sitedown" default="0">
		<cfparam name="client.errortype" default="0">
		<cfparam name="request.actiontype" default="0">
		
		<cfif listfindnocase(application.fileaccesslist,CGI.PATH_TRANSLATED) GT 0>
			<cfinclude template="#arguments.targetPage#">
		<cfelseif CGI.PATH_TRANSLATED NEQ Application.pathofindex OR url.section EQ "accessdenied">
			<cfinclude template="/layout/accessdenied.cfm">
		<cfelse>
			<cfinclude template="#arguments.targetPage#">
		</cfif>
	</cffunction>

</cfcomponent>