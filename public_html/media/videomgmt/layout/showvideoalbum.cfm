<cfparam name="url.id" default="">
<cfparam name="url.s" default="">
<cfparam name="url.c" default="0">
<cfset thereAreItems=FALSE>
<cfoutput>
	<cfset searchAction="/cms/#url.section#/#url.module#/viewalbum">
	<cfinvoke component="#application.objvideolib#" method="getVideos" videodsn="#client.siteurl#" videocategoryid="#url.id#" criteria="#url.s#" status="all" returnvariable="videos">
	<cfif url.c EQ 1>
		<cfinclude template="../display/copyform.cfm">
	<cfelse>
		<cfinclude template="../display/searchform.cfm">
	</cfif>
	<div class="clear"></div>
	<cfif videos.recordcount GT 0>
		<cfset thereAreItems=TRUE>
		<cfset searchAction="/cms/#url.section#/#url.module#/viewalbum">
		<div id="imageGalleryContainer">
			<div class="titleBar">
				<span id="select-actions">
					<a href="##" id="checkAll"><img src="/siteimages/icon-select-all-gallery.png"></a>
					<a href="##" id="doDelete"><img src="/siteimages/icon-gallery-delete.png"></a>
					<a href="##" id="doRemove"><img src="/siteimages/icon-gallery-remove.png"></a>
					<a href="/cms/#url.section#/#url.module#/viewalbum/?id=#url.id#&c=1" id="doCopy"><img src="/siteimages/icon-gallery-copy.png"></a>
				</span>
				<span class="right-hand-side">
					<a href="/cms/#url.section#/#url.module#/addvideo/?id=#url.id#"><img src="/siteimages/icon-gallery-add-video.png"></a>
				</span>
			</div>
			<div class="clear"></div>
			<ul id="imageGallerySorter">
				<cfloop query="videos">
					<cfif status NEQ 'Inactive'>
						<cfif status EQ 'private'>
							<cfset htmltitle="Make it public">
							<cfset cssclass="sortCell private">
						<cfelse>
							<cfset htmltitle="Make it private">
							<cfset cssclass="sortCell">
						</cfif>
						<li id="#vid#" class="#cssclass#">
							<div class="titleBar" title="#title#">
								<input id="chkBox#vid#" class="chkBox" type="checkbox" name="chkBox">
								<label>#application.objtextconversion.shortenText(title,14)#</label>
								<div class="clear"></div>
							</div>
							<center>
								<span class="handle" style="cursor:move;">
									<div id="imageBlock#vid#" class="imageBlock">
										<img src="#client.imagepath#/qdcms/#imagepath#">
									</div>
								</span>
								<a href="/cms/#url.section#/#url.module#/addfile/?id=#url.id#&v=#vid#" title="add File"><img src="/siteimages/icon-add-gallery.gif"></a>
								<a href="/cms/#url.section#/#url.module#/editvideo/?id=#url.id#&v=#vid#" title="Edit Video"><img src="/siteimages/icon-edit-gallery.gif"></a>
								<a href="/cms/#url.section#/#url.module#/viewreport/?v=#vid#" title="Show Report"><img src="/siteimages/icon-report-gallery.gif"></a>
								<span class="lock" title="#htmltitle#" id="lock#vid#">
									<cfif status EQ 'public'>
										<img src="/siteimages/icon-gallery-disapprove.gif">
									<cfelse>
										<img src="/siteimages/icon-gallery-approve.gif">
									</cfif>
								</span>
							</center>
						</li>
					</cfif>
				</cfloop>
				<div class="clear"></div>
			</ul>
		</div>
		<div class="clear"></div>
	<cfelse>
		<cfset albumExists=application.objvideolib.checkAlbum(client.siteurl,url.id)>
		<cfif albumExists>
			<div class="quicknote">
				<h1>There are no videos in this album.Please <a href="/cms/#url.section#/#url.module#/addvideo/?id=#url.id#">click here</a> to add a video to this album</h1>
			</div>
		<cfelse>
			<cflocation url="/cms/#url.section#/#url.module#/showalbums" addtoken="false">
		</cfif>
	</cfif>
</cfoutput> 