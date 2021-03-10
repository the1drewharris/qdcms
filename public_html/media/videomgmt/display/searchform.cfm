<cfoutput>
	<cfset searchword="">
		<cfif url.action EQ "showalbums">
			<cfif url.s NEQ '0'>
				<cfset searchword=url.s>
			</cfif>
		<cfelse>
			<cfset searchword=url.s>
		</cfif>
	<form action="#searchAction#" method="get">
		<div class="left">
			<cfif url.action EQ 'viewalbum'>
				<cfinvoke component="#application.objvideolib#" method="getAllGalleries" videodsn="#client.siteurl#" returnvariable="videogalleries">
				<select name="id" id="albumsQuickJump">
					<option value="0">All Videos</option>
					<cfloop query="videogalleries">
						<option value="#videocategoryid#"<cfif url.id EQ videocategoryid>Selected</cfif>>#category#</option>
					</cfloop>
				</select>
			</cfif>
		</div>
		<div class="right">
			<input type="text" name="s" value="#searchword#">
			<input type="submit" value="Search">		
		</div>
	</form>
</cfoutput>