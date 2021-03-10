<!--- <cfif findnocase('http://demo.qdcms.com/media/imagemgmt/actions/imageBrowser.cfm',CGI.HTTP_REFERER) EQ 0>
	<cflocation url="/cms/accessdenied" addtoken="false">
</cfif> --->
<!--- dev image path --->
<cfif NOT listContainsNoCase('#client.siteurl#', 'jbfsale', '.')>
	<cfset thissite="http://dev.quantumdelta.com/#client.siteurl#/public_html">
<cfelse>
	<cfset thissite="http://#client.siteurl#">
</cfif>
<cfsetting showDebugOutput="No">
<cfparam name="url.s" default="">
<cfparam name="url.category" default="0">
<cfparam name="url.alsoshared" default="0">
<cfinvoke component="imagegallery" method="getGalleries" imagedsn="#client.siteurl#" criteria="#url.s#" categoryid="#url.category#" returnVariable="searchAlbums" />
<cfset didit=FALSE>
<cfif url.alsoshared EQ 1 AND client.parentsiteid NEQ 0>
	<cfinvoke component="site" method="getsiteinfo" siteid="#client.parentsiteid#" returnvariable="parentsiteinfo">
	<cfinvoke component="imagegallery" method="getGalleries" imagedsn="#parentsiteinfo.siteurl#" gallerystatus="shared" returnvariable="sharedAlbums">
	<cfif sharedAlbums.recordcount GT 0>
		<cfset didit=TRUE>
		<cfquery name="allAlbums" dbtype="query">
			SELECT
				IMAGECATEGORYID, 
				SORTORDER,
				IMAGECATEGORY,   
				IMAGEPATH,
				IMAGECOUNT,
				0 AS SHARED,
				'#thissite#'AS SITE 
			FROM searchAlbums
			UNION
			SELECT 
				IMAGECATEGORYID, 
				SORTORDER,
				IMAGECATEGORY,   
				IMAGEPATH,
				IMAGECOUNT,
				1 AS SHARED,
				'http://#client.parentsiteurl#' AS SITE
			FROM sharedAlbums
			ORDER BY SHARED,SORTORDER
		</cfquery>
	</cfif>
</cfif>
<cfif NOT didit>
	<cfquery name="allAlbums" dbtype="query">
		SELECT
			IMAGECATEGORYID, 
			SORTORDER,
			IMAGECATEGORY,   
			IMAGEPATH,
			IMAGECOUNT,
			0 AS SHARED,
			'#thissite#'AS SITE 
		FROM searchAlbums
		ORDER BY SORTORDER
	</cfquery>
</cfif>

<cfoutput>#serializeJSON(allAlbums,true)#</cfoutput>