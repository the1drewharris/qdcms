<cfoutput>
	<cfif url.action EQ "editadvertisement">
		<cfif listfirst(client.thisad) EQ thisadid>
			<cfset adimage=listlast(client.thisad)>
			<cfif adimage NEQ ''>
				<td class="quickWebPageInfo">
					<div class="container">
						<img src="http://#client.siteurl#/ads/#adimage#" width="265">
					</div>
				</td>
			</cfif>
		</cfif>
	</cfif>
</cfoutput>