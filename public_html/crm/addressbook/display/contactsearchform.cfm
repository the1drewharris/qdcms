<cfoutput>
	<cfinvoke component="#Application.abCFC#" method="getGroupName" contactdsn="#client.siteurl#" returnVariable="groups" />
	<div class="options">
		<form method="post" action="/cms/crm/addressbook/searchcontacts">
			<div id="addressbook-quick-jump">
				<select id="albumsQuickJump" name="g">
					<option value="0" <cfif url.g EQ 0>Selected</cfif>>All Contacts</option>
					<option value="-2" <cfif url.g EQ -2>Selected</cfif>>Deleted Contacts</option>
					<option value="-1" <cfif url.g EQ -1>Selected</cfif>>Contacts not in any Group</option>
					<cfloop query="groups">
					<option value="#groupid#"<cfif url.g EQ groupid>Selected</cfif>>#name#</option>
					</cfloop>
				</select>
			</div>
			<div id="addressbook-search-box">
				<input type="text" name="s" id="searchBox" value="#client.searchkey#"/>
				<input type="submit" id="doSearch" value="Search" />
				<cfif url.action EQ 'searchcontacts'>
					<a href="/cms/#url.section#/#url.module#">Show All</a>
				</cfif>
			</div>
		</form>
	</div>
</cfoutput>