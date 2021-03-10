<cfoutput>
	<cfinvoke component="#application.objproduct#" method="getCoupouns" productdsn="#client.siteurl#" noofcoupouns=20 returnvariable="coupons">
	<cfif coupons.recordcount GT 0>
		<h1 style="float:left">Coupons</h1>
		<span class="right"><a href="/cms/#url.section#/#url.module#/addcoupon">+Add Coupon</a></span>
		<table class="datagrid" id="managePagesTable">
			<tr class="titlebar">
				<th>Coupon Code</th>
				<th>Expiry Date</th>
				<th>Allowed</th>
				<th>Used</th>
				<th>Usage Detail</th>
			</tr>
			<cfloop query="coupons">
				<cfif currentRow MOD 2 EQ 0>
					<tr class="alt">
				<cfelse>
					<tr>
				</cfif>
				<td>#coupoun#</td>
				<cfset expirydate=application.objtimedateconversion.convertdate(expireson,'yyyy-mm-dd')>
				<cfset expirytime=application.objtimedateconversion.convertTime(expireson,'hh:mmtt')>
				<td>#expirydate# #expirytime#</td>
				<td>#nooftimesallowed#</td>
		  		<td>#nooftimesused#</td>
				<td><a href="/cms/#url.section#/#url.module#/couponusage/?coupon=#COUPOUN#"><cfif nooftimesused GT 0>Show<cfelse>Details</cfif></a></td>
			</cfloop>
		</table>
	<cfelse>
		<div class="quicknote">
			<h1>No coupon has been generate yet. <a href="/cms/#url.section#/#url.module#/addcoupon">Click here</a> to create a new coupon.</h1>
		</div>
	</cfif>
</cfoutput>