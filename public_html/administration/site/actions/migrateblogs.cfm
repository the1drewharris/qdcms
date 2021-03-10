<cfparam name="form.striphtmlinblogentries" default="false">
<cfquery name="oldBlogEntries" datasource="qdelta">
	SELECT
		EVENTVERSION.EVENTID,
		EVENTVERSION.EVENTNAME as entryname,
		EVENTVERSION.STATUS,
		EVENTVERSION.PEERORDERNUMBER,
		EVENTVERSION.VERSIONID,
		EVENTVERSION.STARTTIME as posttime,
		EVENTVERSION.actualstarttime,
		EVENTVERSION.ENDTIME,
		EVENTVERSION.SEDESCRIPTION as excerpt,
		EVENTVERSION.KEYWORDS,
		EVENTVERSION.TITLE,
		EVENTVERSION.DESCRIPTION as entry,
		SITE.SITEID AS SITESID,
		EVENT2SITE.EVENTID AS Expr12,
		EVENT2SITE.SITEID AS Expr13,
		SITEVERSION.SITEID,
		SITEVERSION.SITENAME,
		SITEVERSION.SITEURL,
		SITEVERSION.VERSIONID AS SITEVERSIONID,
		EVENT.EVENTID AS Expr1,
		EVENT.EVENTNAME AS Expr2,
		EVENTVERSION.PREDESSOREVENTID,
		EVENTVERSION.PARENTEVENTID,
		EVENTVERSION.FUSEACTIONID,
		EVENTVERSION.PEERORDERNUMBER,
		EVENTVERSION.IMAGEID,
		EVENTVERSION.PERCENTCOMPLETE,
		EVENTVERSION.CUSTOMCSS,
		EVENTVERSION.PRINTCSS,
		EVENTVERSION.SCREENCSS,
		EVENTCATEGORY.EVENTCATEGORYID,
		EVENTCATEGORY.EVENTCATEGORY,
		EVENT2EVENTCATEGORY.EVENTID AS Expr3,
		EVENT2EVENTCATEGORY.EVENTCATEGORYID AS Expr4
		FROM
		EVENT2EVENTCATEGORY
		INNER JOIN
		EVENT
		ON EVENT2EVENTCATEGORY.EVENTID = EVENT.EVENTID
		INNER JOIN
		EVENTCATEGORY
		ON EVENT2EVENTCATEGORY.EVENTCATEGORYID = EVENTCATEGORY.EVENTCATEGORYID
		RIGHT OUTER JOIN
		EVENT2SITE
		ON EVENT.EVENTID = EVENT2SITE.EVENTID
		RIGHT OUTER JOIN
		EVENTVERSION
		ON
		EVENT.EVENTID = EVENTVERSION.EVENTID
		AND EVENT2SITE.EVENTID = EVENTVERSION.EVENTID
		RIGHT OUTER JOIN
		SITE
		ON EVENT2SITE.SITEID = SITE.SITEID
		FULL OUTER JOIN
		SITEVERSION
		ON SITE.SITEID = SITEVERSION.SITEID
		WHERE     (SITE.SITEID = <cfqueryparam value="#url.siteid#">)
		AND (EVENTVERSION.VERSIONID =
		  (SELECT     MAX(VERSIONID)
			FROM          EVENTVERSION
			WHERE      EVENTID = EVENT.EVENTID
			AND STATUS <> 'Deleted'))
		AND (SITEVERSION.VERSIONID =
		  (SELECT     MAX(VERSIONID)
			FROM          SITEVERSION
			WHERE      SITEID = SITE.SITEID))
		AND EVENTCATEGORY.EVENTCATEGORY LIKE '%Fishing Report%'
	ORDER BY EVENTVERSION.PEERORDERNUMBER
</cfquery>

<cfinvoke component="#application.objblog#" method="addBlog" ds="#mysiteurl#" Name="Migrated Legacy Blog" authorid="#client.masternameid#" returnvariable="newBlogid">
<cfinvoke component="#application.objblog#" method="addBlogCategory" ds="#mysiteurl#" name="General" authorid="#client.masternameid#" returnvariable="newBlogCatid">

<cfloop query="oldBlogEntries">
	<cfset args=StructNew()>
	<cfset args.ds=mysiteurl>
	<cfset args.name=entryname>
	<cfset args.authorid=client.masternameid>
	<cfset args.postdate=posttime>
	<cfif form.striphtmlinblogentries><cfset args.thisentry=application.objtextconversion.stripHTML(entry)><cfelse><cfset args.thisentry=entry></cfif>
	<cfset args.title=title>
	<cfset args.keywords=keywords>
	<cfset args.entry = entry>
	<cfset args.lastupdatedby = "David Clark">
	<cfset args.description=excerpt>
	<cfset args.entrystatus="Published">
	<cfinvoke component="#application.objblog#" method="addBlogEntry" argumentcollection="#args#" returnvariable="newBlogEntryid">
	<cfinvoke component="#application.objblog#" method="addBlogEntrytoBlog" ds="#mysiteurl#" blogid="#newBlogid#" blogentryid="#newBlogEntryid#">
	<cfinvoke component="#application.objblog#" method="addBlogEntrytoBlogCategory" ds="#mysiteurl#" blogcategoryid="#newBlogCatid#" blogentryid="#newBlogEntryid#">
</cfloop>
