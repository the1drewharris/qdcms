<cfoutput>
	<cfinvoke component="#application.objproduct#" method="getPricenames" productdsn="#client.siteurl#" returnvariable="allPrices">
	<cfif allPrices.recordcount GT 0>
		<cfloop query="allPrices">
			<div class="justLabel">
				<span class="left">#pricename#</span>
				<span class="right">
					<input type="text" name="priceid:#pricenameid#" value="#application.objtextconversion.setformvalue('#pricename#')#">
				</span>
			</div>
			<div class="clear"></div>
		</cfloop>
		<div class="clear"><br /></div>
	</cfif>
</cfoutput>