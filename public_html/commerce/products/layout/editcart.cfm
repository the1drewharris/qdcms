<cfoutput>
	<cfparam default="0" name="myContact">
	<cfparam default="0" name="url.sold">
	<cfinvoke component="#application.objnewcart#" method="getcartowner" cartdsn="#client.siteurl#" cartid="#url.c#" returnvariable="cartOwner">
	<cfif cartOwner neq 0>
		<cfset client.cartOwner=cartOwner>
		<cfinvoke component="#application.abCFC#" method="getPersonalInfo" contactdsn="#client.siteurl#" nameid="#client.cartOwner#" returnvariable="myContact">
	</cfif>
	<cfif url.sold eq 1>
		<cfquery name="soldCart" datasource="#client.siteurl#">
		SELECT CARTID,
		CARTSOLD
		FROM SOLDCART
		WHERE CARTID = <cfqueryparam value="#url.c#">
		</cfquery>
	</cfif>
	<table>
	<tr>
		<td valign="top" width="510">
			<cfif isQuery(myContact)>
			<h1>Cart for</h1>
			#myContact.firstname# #myContact.lastname# of #myContact.address1# #myContact.city#, #myContact.state#  #myContact.state#<br />
			#myContact.hphone#<br />
			<a href="mailto:#myContact.hemail#">#myContact.hemail#</a>
			</cfif>
			<cfif url.sold eq 1>
				<cfif soldCart.recordcount gt 0>
				#soldCart.cartSold#
				<cfelse>
				<h1>This cart was completed (sold). But, we don't have the details on it since it was completed before we added the tracking of sold carts.</h1>
				</cfif>
			<cfelse>
				<cfinvoke component="#application.objnewcart#" method="getCart" cartdsn="#client.siteurl#" cartid="#url.c#" returnvariable="cart">
				<cfset amt = XmlParse(cart).mycart.carttotal[1].xmltext>
				<cfif amt GT 0>
				<h2>This UI (User Interface) does not determine, show or support freight or tax.</h2>
				<p>Also, completing this transaction here will <strong>NOT</strong> process payment, you will need to do that independently through your payment gateway.</p>
					<cfdump var="#cart#">
				<br />
				<strong>Total Amount: #amt#</strong>
				<cfelse> 
					<h1>There are no items in the cart</h1>
				</cfif>
				<br /><br />
				<a href="/cms/#url.section#/#url.module#/completetransaction/?c=#url.c#"><h2>Complete this Transaction<h2></a>
			</cfif>
		</td>
		
		<td valign="top">
			
		</td>
	</tr>
	</table>
</cfoutput>
