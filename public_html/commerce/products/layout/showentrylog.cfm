<cfoutput>
	<cfinvoke component="#application.objproduct#" method="getproductlog" productdsn="#client.siteurl#" returnvariable="log">
	<cfif log.recordcount GT 0>
		<h1 style="float:left">Entry Log</h1>
		<span class="right"><a href="/cms/#url.section#/#url.module#/addproduct">+ Add Product</a></span>
		<table class="datagrid" id="managePagesTable">
			<tr class="titlebar">
				<th>Product</th>
				<th>Category</th>
				<th>Description</th>
				<th>Quantity</th>
				<th>Entry Date</th>
			</tr>
			<cfloop query="log">
				<cfif currentRow MOD 2 EQ 0>
					<tr class="alt">
				<cfelse>
					<tr>
				</cfif>
				<td>#itemname#</td>
				<td>#category#</td>
		  		<td>#description#</td>
				<td>#quantity#</td>
				<cfset entrydate=application.objtimedateconversion.convertDate(timedate,'yyyy-mm-dd')>
				<cfset entrytime=application.objtimedateconversion.convertTime(timedate,'hh:mmtt')>
				<td>#entrydate# #entrytime#</td>
			</cfloop>
		</table>
	<cfelse>
		<div class="quicknote">
			No products has been added yet. <a href="/cms/#url.section#/#url.module#/addproduct">Click here</a> to add a product.
		</div>
	</cfif>
</cfoutput>