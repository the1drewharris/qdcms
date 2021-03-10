<!--- Migrates legacy galleries to qdcms, creates temp directory if it is not there, creates sub directories inside temp for jbf subsites --->

<cfset path = "#Application.basepath#/#mysiteurl#/public_html">

<cfif listlen(mysiteurl,'.') LT 3>
	<cfset path="#application.basepath#/#mysiteurl#/public_html">
	<cfset parentsite=0>
<cfelse>
	<cfset parentsite="#listGetAt(mysiteurl,2,'.')#.#listGetAt(mysiteurl,3,'.')#">
	<cfset subsiteFolder=listfirst(mysiteurl,'.')>
	<cfset path="#application.basepath#/#parentsite#/public_html/#subsiteFolder#">
</cfif>

<cfif NOT directoryExists('#path#/images/temp')>
	<cfdirectory action="create" directory="#path#/images/temp" mode="775">
</cfif>

<cfif parentsite EQ 'jbfsale.com'>
	<cfset tempDirList="9fe556,dcff82,e5b03a"> <!--- create special folders in images/temp for jbf sites --->
	<cfloop list="#tempDirList#" index="dir">
		<cfif NOT directoryExists('#path#/images/temp/#dir#')>
			<cfdirectory action="create" directory="#path#/images/temp/#dir#" mode="775">
		</cfif>
	</cfloop>
</cfif>

<cfif systemId EQ 1 OR parentsite EQ 'jbfsale.com'>
	<cfinvoke component="#application.objimagegallery#" method="getLegacyGalleries" siteid="#url.siteid#" returnvariable="legacyImageGalleries">
	<cfloop query="legacyImageGalleries">
		<cfinvoke component="#application.objimagegallery#" method="addGallery" imagedsn="#mysiteurl#" galleryname="#imagecategory#" status="#status#" returnvariable="newgalleryid">
		<cfinvoke component="#application.objimagegallery#" method="getLegacyImages" categoryid="#imagecategoryid#" returnvariable="legacyImages">
		<cfloop query="legacyImages">
			<cfset file_ext=ListLast(imagepath, '.')>
			<cfif compare(file_ext,'JPG') EQ 0>
				<cfset file_ext='jpg'>
			</cfif>
			<cfif listfindnocase(application.allowedimagetypes,file_ext) GT 0>
				<!---Start Copying Image --->
				<cfinvoke component="#application.objsecurity#" method="getRandomUsername" returnvariable="randomName">
				<cfset myNewImage="i#randomName##application.objtimedateconversion.createTimeDate()#.#file_ext#">
				<cfset masterimage=myNewImage>
				<cfset src="#path#/images/#imagepath#">
				<cfset dest="#path#/images/#myNewImage#">
				<cftry>
					<cfimage action="write" destination="#dest#" source="#src#" overwrite="yes" quality="1.0" >
					<cfinclude template="createthumbs.cfm">
					<cfinvoke component="#application.objimagegallery#" method="addImage" caption="#caption#" title="#caption#" imagedsn="#mysiteurl#" userid="#client.masternameid#" imagename="#masterimage#" returnVariable="newimageid">
					<cfinvoke component="#application.objimagegallery#" method="addImageToGallery" imagedsn="#mysiteurl#" userid="#client.masternameid#" imageid="#newimageid#" galleryid="#newgalleryid#">
					<cfcatch type="any">
						<cfset client.errorlist=ListAppend(client.errorlist,"Could Not copy: #src#")>
					</cfcatch>
				</cftry>
				<!--- End Copying --->
			</cfif>
		</cfloop>
	</cfloop>
<cfelseif systemId EQ 2>
	<cfinvoke component="#application.objimagegallery#" method="getAllImages" imagedsn="#mysiteurl#" returnvariable="allimages">
	<cfloop query="allimages">
		<cfset masterimage=imagepath>
		<cfinclude template="createthumbs.cfm">
	</cfloop>
</cfif>