<cfoutput>
	<cfinvoke component="#application.objproduct#" method="getPrices" productdsn="#client.siteurl#" id="#url.p#" returnvariable="prices">
	<cfif prices.recordcount GT 0>
		<table class="datagrid" id="managePagesTable">
			<cfloop query="prices">
				<cfif currentRow MOD 2 EQ 0><tr class="alt"><cfelse><tr></cfif>
					<td>#pricename#</td>
					<td>#price#</td>
				</tr>
			</cfloop>
		</table>
	</cfif>
</cfoutput>