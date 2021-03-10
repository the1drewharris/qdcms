<cfoutput>
	<cfparam name="url.s" default="">
	<cfset thereAreItems=FALSE>
	<cfset searchAction="/cms/#url.section#/#url.module#/showalbums/">
	<cfinvoke component="#application.objimagegallery#" method="getGalleries" imagedsn="#client.siteurl#" criteria="#url.s#" returnVariable="albums">
	<cfif albums.recordcount GT 0>
		<cfset thereAreItems=TRUE>
		<cfset imgsrcpath="#client.imagepath#/qdcms">
		<div class="left">
			<h1>Albums</h1>
		</div>
		<div class="right">
			<cfinclude template="../display/searchform.cfm">
		</div>
		<div class="clear"></div>
		<div id="imageGalleryContainer">
			<div class="titleBar">
				<a id="checkAll" href="##">
					<img src="/siteimages/icon-select-all-gallery.png">
				</a>
				<a id="doDelete" href="##">
					<img src="/siteimages/icon-delete-album-gallery.png">
				</a>
				<a href="/cms/#url.section#/#url.module#/addalbum" style="float:right">
					<img src="/siteimages/icon-add-album-gallery.png">
				</a>
			</div>
			<div class="clear"></div>
			<ul id="imageGalleries">
				<cfloop query="albums">
					<li id="#imagecategoryid#" class="sortCell">
						<div class="titleBar" title="#imagecategory#">
							<input id="chkBox#imagecategoryid#" class="chkBox" type="checkbox" name="chkBox">
							<label id="imagetitle#imagecategoryid#" for="chkBox#imagecategoryid#">#application.objtextconversion.shortenText(imagecategory)#</label>
							<div class="clear"></div>
						</div>
						<center>
							<span class="handle" style="cursor: move">
								<div id="imageblock#imagecategoryid#" class="imageBlock">
									<cfif imagepath NEQ "">
										<img src="#imgsrcpath#/#imagepath#">
									<cfelse>
										<img src="/siteimages/icon-no-images-album.gif">
									</cfif>
								</div>
							</span>
							<span class="quickGalleryInfo">Images: #imagecount#</span>
							<a href="/cms/#url.section#/#url.module#/editalbum/?id=#imagecategoryid#">
								<img src="/siteimages/icon-edit-gallery.gif">
							</a>
							<a href="/cms/#url.section#/#url.module#/viewalbum/?id=#imagecategoryid#">
								<img src="/siteimages/icon-view-gallery.gif">
							</a>
						</center>
					</li>	
				</cfloop>
				<div class="clear"></div>
			</ul>
		</div>
		<div class="clear"></div>
	<cfelse>
		<div class="quicknote">
			<h1>There are no images galleries in this site. Please <a href="/cms/#url.section#/#url.module#/addalbum">click here</a> to add your first image album</h1>
		</div>
	</cfif>
</cfoutput>