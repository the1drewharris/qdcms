<cfparam name="url.l" default="0"> <!--- list of images --->

<!--- 
	Begin: Validation Part 
	Explanation: making sure that request is coming from viewalbum action is sufficient to verify that it is a valid request
	r: referer
	a: alternate referer
	rl: referer link
	p: position of ?
--->

<cfset allIsWell=FALSE>
<cfset r='http://#application.dsn#/cms/#url.section#/#url.module#/showalbums/'>
<cfset a='http://www.#application.dsn#/cms/#url.section#/#url.module#/showalbums/'>
<cfset rl=rereplace(CGI.HTTP_REFERER,'\?s=.*','','one')>
<cfif (rl EQ r) OR (rl EQ a)>
	<cfset allIsWell=TRUE>	
</cfif>
<!--- End: Validation Part --->
<cfif allIsWell>
	<cftransaction>
		<cfinvoke method="deleteGalleries" imagedsn="#client.siteurl#" galleries="#url.l#">
	</cftransaction>
	<cfinclude template="/actions/tracking.cfm">
</cfif>

<cflocation url="#CGI.HTTP_REFERER#" addtoken="false">

<cffunction name="deleteGalleries" output="false" returntype="void" access="public" hint="I remove the image gallery passed to me">
	<cfargument  name="imagedsn" type="string" required="true" hint="The datasource for the images">
	<cfargument name="galleries" type="string" required="true" hint="ID of the gallery you want to remove to remove the image from">
	<cfset var remove=0>
	<cfquery name="remove" datasource="#arguments.imagedsn#">
		DELETE FROM IMAGE2IMAGECATEGORY
		WHERE IMAGECATEGORYID IN (#arguments.galleries#)
	</cfquery>
	<cfquery name="remove" datasource="#arguments.imagedsn#">
		DELETE FROM IMAGECATEGORY
		WHERE IMAGECATEGORYID IN (#arguments.galleries#)
	</cfquery>
	<cfreturn>
</cffunction>