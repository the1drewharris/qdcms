<cfparam name="url.s" default="">
<cfoutput>
	<form method="get" action="#searchAction#">
		<div class="left">
			<cfif url.action EQ "viewalbum">
			<select name="id" id="albumsQuickJump">
			<cfloop query="albumList">
				<option value="#imagecategoryid#" <cfif url.id EQ imagecategoryid>Selected</cfif>>#imagecategory#</option>
			</cfloop>
			</select>
			</cfif>
		</div>
		<div class="right">
			<input type="text" name="s">
			<input type="submit" value="Search">
			<cfif url.action EQ "viewalbum" and url.s NEQ "">
				<a href="/cms/#url.section#/#url.module#/viewalbum/?id=#url.id#">Show All</a>
				<br /><br />
			</cfif>
		</div>
	</form>
</cfoutput>