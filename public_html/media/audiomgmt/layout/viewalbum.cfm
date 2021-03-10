<cfparam name="url.id" default=0>
<cfparam name="url.s" default="">
<cfparam name="url.c" default="0">
<cfset thereAreItems=FALSE>
<cfoutput>
	<cfset searchAction="/cms/#url.section#/#url.module#/viewalbum">
	<cfif url.c NEQ 1>
		<cfinclude template="../display/searchform.cfm">
	<cfelse>
		<cfinclude template="../display/copyform.cfm">
	</cfif>
	<cfinvoke component="#application.objvideolib#" method="getVideos" videodsn="#client.siteurl#" videocategoryid="#url.id#" mediatypeid="2" criteria="#url.s#" status="all" returnvariable="audios">
	<cfif audios.recordcount>
		<cfset thereAreItems=TRUE>
		<div class="clear"></div>
		<div id="imageGalleryContainer">
			<div class="titleBar">
				<span id="select-actions">
					<a href="##" id="checkAll"><img src="/siteimages/icon-select-all-gallery.png"></a>
					<a href="##" id="doDelete"><img src="/siteimages/icon-gallery-delete.png"></a>
					<a href="##" id="doRemove"><img src="/siteimages/icon-gallery-remove.png"></a>
					<a href="/cms/#url.section#/#url.module#/viewalbum/?id=#url.id#&c=1" id="doCopy"><img src="/siteimages/icon-gallery-copy.png"></a>
				</span>
				<span class="right-hand-side">
					<a href="/cms/#url.section#/#url.module#/addaudio/?id=#url.id#"><img src="/siteimages/icon-gallery-add-video.png"></a>
				</span>
			</div>
			<div class="clear"></div>
			<ul id="imageGallerySorter">
				<cfloop query="audios">
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
										<img src="/siteimages/audio-thumb.gif">
									</div>
								</span>
								<a href="/cms/#url.section#/#url.module#/addfile/?v=#vid#" title="add File"><img src="/siteimages/icon-add-gallery.gif"></a>
								<a href="/cms/#url.section#/#url.module#/editaudio/?id=#url.id#&v=#vid#" title="Edit Video"><img src="/siteimages/icon-edit-gallery.gif"></a>
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
		<div class="quicknote">
			<h1>There are no audios in this album.Please <a href="/cms/#url.section#/#url.module#/addaudio/?id=#url.id#">click here</a> to add an audio to this album</h1>
		</div>
	</cfif>
</cfoutput> 