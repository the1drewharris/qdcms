<cfoutput>
	<cfparam name="url.s" default='0'>
	<cfset thereAreItems=FALSE>
	<cfset searchAction="/cms/#url.section#/#url.module#/showalbums">
	<cfinvoke component="#application.objvideolib#" method="getCategory" videodsn="#client.siteurl#" criteria="#url.s#" returnvariable="albums">
	<cfset imgsrcpath="#client.imagepath#/qdcms">
	<cfif albums.recordcount GT 0>
	<cfset thereAreItems=TRUE>
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
			<a class="right-hand-side" href="/cms/#url.section#/#url.module#/addalbum">
				<img src="/siteimages/icon-add-album-gallery.png">
			</a>
		</div>
		<div class="clear"></div>
		<ul id="imageGalleries">
			<cfloop query="albums">
				<li id="#videocategoryid#" class="sortCell">
					<div class="titleBar" title="#category#">
						<input type="checkbox" id="chkBox#videocategoryid#" class='chkBox'>
						<label id="imagetitle#videocategoryid#" for="chkBox#videocategoryid#">#application.objtextconversion.shortenText(category,15)#</label>
					</div>
					<center>
						<span class="handle" style="cursor:move">
							<div id="imageblock#videocategoryid#" class="imageBlock">
								<cfif imagepath NEQ ''>
									<img src="#imgsrcpath#/#imagepath#">
								<cfelse>
									<img src="/siteimages/icon-no-images-album.gif">
								</cfif>
							</div>
						</span>
						<span class="quickGalleryInfo">Videos: #videocount#</span>
						<a href="/cms/#url.section#/#url.module#/editalbum/?id=#videocategoryid#">
							<img src="/siteimages/icon-edit-gallery.gif">
						</a>
						<a href="/cms/#url.section#/#url.module#/viewalbum/?id=#videocategoryid#">
							<img src="/siteimages/icon-view-gallery.gif">
						</a>
					</center>
				</li>
			</cfloop>
			<div class="clear"></div>
		</ul>
		<div class="clear"></div>
	</div>
	<cfelse>
		<div class="quicknote">
			<h1>There are no  video albums in this site. Please <a href="/cms/#url.section#/#url.module#/addalbum">click here</a> to add a video album to this site</h1>
		</div>
	</cfif>
</cfoutput>

