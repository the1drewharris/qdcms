<cfinvoke component="#application.objimagegallery#" method="getQuickGalleriesInfo" imagedsn="#client.siteurl#" returnvariable="galleries">
<cfoutput>
	<div class="options" id="albumoptions">
		<h3>Select images and the albums you want the images to copy to</h3>
		<form id="form">
			<cfloop query="galleries">
				<div style="float:left">
					<input type="checkbox" id="album_#imagecategoryid#" name="albums" value="#imagecategoryid#">&nbsp;#imagecategory#
				</div>
			</cfloop>
			<span style="float:right">
				<a href="##" id="copytoalbums">Copy To Albums</a>
			</span>
		</form>
	</div>
	<div class="clear"></div><br />
</cfoutput>