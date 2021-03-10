<cfoutput>
	<cfinvoke component="#application.objnewcart#" method="getallcarts" cartdsn="#client.siteurl#" returnvariable="carts">
	<cfif carts.recordcount GT 0>
		<table class="datagrid" id="managePagesTable">
			<tr class="titlebar">
				<th>Cart ID</th>
				<th>Active</th>
				<!---<th>User</th>--->
				<th>Date Created</th>
				<th></th>
			</tr>
			<cfloop query="carts">
				<cfif currentRow MOD 2 EQ 0>
					<tr class="alt">
				<cfelse>
					<tr>
				</cfif>
				<td>
					<cfif active eq 1>
						<a href="/cms/#url.section#/#url.module#/editcart/?c=#cartid#&sold=0" class="name">#cartid#</a>
					<cfelse>
						<a href="/cms/#url.section#/#url.module#/editcart/?c=#cartid#&sold=1" class="name">#cartid#</a>
					</cfif>
				</td>
				<td><cfif active eq 1>Yes<cfelse>No</cfif></td>
				<!---<td><cfif isDefined('firstname')>#firstname#</cfif> <cfif isDefined('lastname')>#lastname#</cfif></td>--->
				<cfset d=application.objtimedateconversion.convertDate(createdon,'yyyy-mm-dd')>
				<cfset t=application.objtimedateconversion.convertTime(createdon,'hh:mmtt')>
		  		<td>#d# #t#</td>
			</cfloop>
		</table>
	<cfelse>
		<div class="quicknote">
			<h1>There are no active carts</h1>
		</div>
	</cfif>
</cfoutput>