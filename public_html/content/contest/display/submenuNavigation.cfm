<cfoutput>
	<ul id="submenuNavigation">
		<li><a href ="/cms/content/contest/addcontest">Add Contest</a></li>
		<li><a href ="/cms/content/contest/showcontests">Show Contests</a></li>
		<cfif url.action EQ "showentries">
			<li><a href ="/cms/content/contest/selectwinner/?contestid=#url.contestid#">Pick Random Winner</a></li>
		</cfif>
	</ul>
	<div class="clear"></div>
</cfoutput>