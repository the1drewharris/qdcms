<cfoutput>
	<cfinvoke component="#application.objproduct#" method="getPricenames" productdsn="#client.siteurl#" returnvariable="prices">
	<cfif prices.recordcount GT 0>
		<h1 style="float: left">Prices</h1>
		<span class="right">
			<a href="/cms/#url.section#/#url.module#/addprice">+ Add Price
		</span>
		<div class="clear"></div>
		<table class="datagrid" id="managePagesTable">
			<tr class="titlebar">
				<th>Price</th>
				<th></th>
			</tr>
			<cfloop query="prices">
				<cfif currentRow MOD 2 EQ 0>
					<tr class="alt">
				<cfelse>
					<tr>
				</cfif>
				<td>
					<a href="/cms/#url.section#/#url.module#/editprice/?p=#pricenameid#" class="name">#pricename#</a>			
				</td>
				<td></td></tr>
			</cfloop>
		</table>
	<cfelse>
		<div class="quicknote">
			No Prices are added to the database. <a href="/cms/#url.section#/#url.module#/addprice">Click here</a> to add a price.
		</div>
	</cfif>
</cfoutput>