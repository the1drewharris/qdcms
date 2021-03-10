<cfparam name="url.id" default="">
<cfparam name="url.s" default="">
<cfparam name="url.c" default="0">
<cfset thereAreItems=FALSE>
<cfif url.id EQ "" AND session.defaultimagegallery NEQ "">
	<cfset url.id=session.defaultimagegallery>
<cfelse>
	<cfset session.defaultimagegallery=url.id>
</cfif>

<div id="divFileProgressContainer"></div>

<cfoutput>
	<cfinvoke component="#application.objimagegallery#" method="getQuickGalleriesInfo" imagedsn="#client.siteurl#" returnvariable="albumList">
	<cfif isNumeric(url.id) AND listfindnocase(valuelist(albumList.imagecategoryid),url.id) GT 0>
		<cfinvoke component="#application.objimagegallery#" method="searchImages" imagedsn="#client.siteurl#" galleryid="#url.id#" criteria="#url.s#" returnvariable="images">
		<cfset searchAction="/cms/#url.section#/#url.module#/#url.action#/">
		<cfif url.c EQ 1>
			<cfinclude template="../display/copyform.cfm">
		<cfelse>
			<cfinclude template="../display/searchform.cfm">
		</cfif>
		<div class="clear"></div>
		<cfif images.recordcount GT 0>
			<cfset thereAreItems=TRUE>
			<div id="imageGalleryContainer">
				<div class="titleBar">
					<span id="select-actions">
						<a href="##" id="checkAll"><img src="/siteimages/icon-select-all-gallery.png"></a>
						<a href="##" id="doDelete"><img src="/siteimages/icon-gallery-delete.png"></a>
						<a href="##" id="doRemove"><img src="/siteimages/icon-gallery-remove.png"></a>
						<a href="/cms/#url.section#/#url.module#/viewalbum/?id=#url.id#&c=1" id="doCopy"><img src="/siteimages/icon-gallery-copy.png"></a>
					</span>
					<span class="right-hand-side"><span id="uploadbutton"><!--- javascript pushes flash button here ---></span></span>
				</div>
				<div class="clear"></div>
				<ul id="imageGallerySorter">
					<cfloop query="images">
						<cfif status EQ 'active'>
							<cfset htmltitle="Make it private">
							<cfset cssclass="sortCell">
						<cfelse>
							<cfset htmltitle="Make it public">
							<cfset cssclass="sortCell private">
						</cfif>
						
						<li id="#imageid#" class="#cssclass#">
							<div class="titleBar" title="#title#">
								<input id="chkBox#imageid#" class="chkBox" type="checkbox" name="chkBox">
								<label for="chkBox#imageid#">#application.objtextconversion.shortenText(title,14)#</label>
								<div class="clear"></div>
							</div>
							<center>
								<span id="handle#imageid#" class="handle">
									<div id="imageBlock#imageid#" class="imageBlock" id="thumbs#imageid#">
										<img src="#client.imagepath#/qdcms/#imagepath#">
									</div>
								</span>
								<a href="/cms/#url.section#/#url.module#/editimage/?i=#imageid#" title="Edit">
									<img src="/siteimages/icon-edit-gallery.gif">
								</a>
								<span class="rotateLeft" title="Rotate image left" id="rotateLeft#imageid#">
									<img src="/siteimages/icon-rotate-left-gallery.gif">
								</span>
								<span class="rotateRight" title="Rotate image right" id="rotateRight#imageid#">
									<img src="/siteimages/icon-rotate-right-gallery.gif">
								</span>
								<span class="lock" title="#htmltitle#" id="lock#imageid#">
									<cfif status NEQ 'Pending'>
										<img src="/siteimages/icon-gallery-disapprove.gif">
									<cfelse>
										<img src="/siteimages/icon-gallery-approve.gif">
									</cfif>
								</span>
							</center>
						</li>
					</cfloop>
					<div class="clear"></div>
				</ul>
			</div>
			<div class="clear"></div>
		<cfelse>
			<div class="quicknote">
				<h1>There are no images in this gallery. <span id="uploadbutton"></span></h1>
			</div>
		</cfif>
		<div class="clear"></div>
	<cfelse>
		<cflocation url="/cms/#url.section#/#url.module#/showalbums/" addtoken="false">
	</cfif>
</cfoutput>