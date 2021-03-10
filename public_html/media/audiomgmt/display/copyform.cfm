<cfinvoke component="#application.objvideolib#" method="getAllGalleries" videodsn="#client.siteurl#" returnvariable="galleries">
<cfoutput>
	<div class="options" id="albumoptions">
		<h3>Select videos and the albums you want the videos to copy to</h3>
		<form id="form">
			<cfloop query="galleries">
				<div style="float:left">
					<input type="checkbox" id="album_#videocategoryid#" name="albums" value="#videocategoryid#">&nbsp;#category#
				</div>
			</cfloop>
			<span style="float:right">
				<a href="##" id="copytoalbums">Copy To Albums</a>
			</span>
		</form>
	</div>
	<div class="clear"></div><br />
</cfoutput>