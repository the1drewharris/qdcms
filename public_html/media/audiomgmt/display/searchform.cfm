<cfoutput>
	<form action="#searchAction#" method="get">
		<div class="left">
			<cfif url.action EQ 'viewalbum'>
				<cfinvoke component="#application.objvideolib#" method="getAllGalleries" videodsn="#client.siteurl#" returnvariable="videogalleries">
				<select name="id" id="albumsQuickJump">
					<option value="0">All Audios</option>
					<cfloop query="videogalleries">
						<option value="#videocategoryid#"<cfif url.id EQ videocategoryid>Selected</cfif>>#category#</option>
					</cfloop>
				</select>
			</cfif>
		</div>
		<div class="right">
			<input type="text" name="s">
			<input type="submit" value="Search">		
		</div>
		<div class="clear"></div>
	</form>
</cfoutput>