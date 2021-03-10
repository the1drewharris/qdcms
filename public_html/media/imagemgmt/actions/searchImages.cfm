<!--- <cfcontent type="text/x-json"> --->
<!--- <cfif findnocase('http://demo.qdcms.com/media/imagemgmt/actions/imageBrowser.cfm',CGI.HTTP_REFERER) EQ 0>
	<cflocation url="/cms/accessdenied" addtoken="false">
</cfif> --->

<cfsetting showDebugOutput="No">
<cfparam name="url.s" default="">
<cfparam name="url.gid" default="0">
<cfparam name="url.status" default="0">
<cfparam name="url.id" default="0">
<cfparam name="url.shared" default="0">

<cfset thissite="http://#client.siteurl#">
<!--- dev image path --->
<cfif NOT listContainsNoCase('#client.siteurl#', 'jbfsale', '.')>
	<cfset thissite="http://dev.quantumdelta.com/#client.siteurl#/public_html">
<cfelse>
	<cfset thissite="http://#client.siteurl#">
</cfif>
<cfif url.id EQ '0'>
	<cfif url.shared EQ 0>
		<cfinvoke component="imagegallery" method="searchImages" imagedsn="#client.siteurl#" galleryid="#url.gid#" criteria="#url.s#" status="#url.status#" returnVariable="searchImages" />
	<cfelse>
		<!---<cfinvoke component="site" method="getsiteinfo" siteid="#client.parentsiteid#" returnvariable="parentsiteinfo">--->
		<cfinvoke component="imagegallery" method="searchImages" imagedsn="#client.parentsiteurl#" galleryid="#url.gid#" criteria="#url.s#" status="#url.status#" returnVariable="searchImages" />
		<cfset thissite="http://#client.parentsiteurl#">
	</cfif>
<cfelse>
	<cfinvoke component="imagegallery" method="getImage" imagedsn="#client.siteurl#" imageid="#url.id#" returnVariable="searchImages" />
</cfif>

<cfquery name="searchImagesWithSiteInfo" dbtype="query">
	SELECT
		IMAGEID, 
		IMAGEPATH, 
		TITLE, 
		IMAGENAME, 
		CREATEDBYID,
		IMAGECATEGORYID,
		STATUS,
		ALT,
		'#thissite#' AS SITE
	FROM searchImages
</cfquery>
<cfoutput>#serializeJSON(searchImagesWithSiteInfo,true)#</cfoutput>
