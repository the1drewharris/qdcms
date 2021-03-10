<cfparam name="url.c" default="0">
<cfif isNumeric(url.c) and url.c GTE 1>
	<cfinvoke component="#application.objnewcart#" method="getCart" cartdsn="#client.siteurl#" cartid="#url.c#" returnvariable="cart">
	<cfif cart.mycart.Noofitems.XmlText GTE 1>
		<cfinvoke component="#application.objnewcart#" method="getcartowner" cartdsn="#client.siteurl#" cartid="#url.c#" returnvariable="nameid">
		<cfset args=StructNew()>
		<cfset args.productdsn=client.siteurl>
		<cfset args.nameid=nameid>
		<cfset args.buyerid=nameid>
		<cfset args.transactiontotal=cart.mycart.carttotal.XmlText>
		<cfset args.cartid=url.c>
		<cfset args.transactionid=url.c>
		<cfset noofitems=cart.mycart.NoofItems.XmlText>
		<cftry>
			<cftransaction>
				<cfinvoke component="#application.objproduct#" method="createtransaction" argumentcollection="#args#">
				<cfloop from="1" to="#noofitems#" index="i">
					<cfset argsSales=StructNew()>
					<cfset argsSales.productdsn=client.siteurl>
					<cfset argsSales.transactionid=url.c>
					<cfset argsSales.id=cart.mycart.item[i].XmlAttributes.id>
					<cfset argsSales.unitprice=cart.mycart.item[i].XmlAttributes.price>
					<cfinvoke component="#application.objproduct#" method="addsales" argumentcollection="#argsSales#">
					<cfif cart.mycart.item[i].XmlAttributes.itemtype EQ 'Subscriptionplan'>
						<cfset itemid=cart.mycart.item[i].XmlAttributes.id>
						<cfinvoke component="#application.objsubscription#" method="getsubscriptionid" subscriptiondsn="#client.siteurl#" id="#itemid#" nameid="#nameid#" returnvariable="subscriptionid">
						<cfif subscriptionid EQ 0>
							<cfinvoke component="#application.objsubscription#" method="addsubscribed" subscriptiondsn="#client.siteurl#" id="#itemid#" nameid="#nameid#" returnvariable="subscriptionid">
							<cfset renewaldate=now()>
						<cfelse>
							<cfinvoke component="#application.objsubscription#" method="getrenewaldate" subscriptiondsn="#client.siteurl#" subscriptionid="#subscriptionid#" returnvariable="oldrenewaldate">
							<cfset renewaldate=application.objtimedateconversion.stringToDate(oldrenewaldate)>
							<cfif renewaldate LT now()>
								<cfset renewaldate=now()>
							</cfif>
						</cfif>
						<cfinvoke component="#application.objsubscription#" method="getsubscriptionplans" subscriptiondsn="#client.siteurl#" id="#itemid#" returnvariable="plan">
						<cfswitch expression="#plan.termmeasure#">
							<cfcase value="Minutes">
								<cfset renewaldate=DateAdd("n",plan.term,renewaldate)>
							</cfcase>
							<cfcase value="Hours">
								<cfset renewaldate=DateAdd("h",plan.term,renewaldate)>
							</cfcase>
							<cfcase value="Days">
								<cfset renewaldate=DateAdd("d",plan.term,renewaldate)>
							</cfcase>
							<cfcase value="Weeks">
								<cfset renewaldate=DateAdd("ww",plan.term,renewaldate)>
							</cfcase>
							<cfcase value="Months">
								<cfset renewaldate=DateAdd("m",plan.term,renewaldate)>
							</cfcase>
							<cfcase value="Years">
								<cfset renewaldate=DateAdd("yyyy",plan.term,renewaldate)>
							</cfcase>
						</cfswitch>
						<cfset renewaldate = "#DateFormat(renewaldate,'yyyymmdd')##timeformat(renewaldate,'HHmmss')#00">
						<cfinvoke component="#application.objsubscription#" method="addsubscription" subscriptiondsn="#client.siteurl#" subscriptionid="#subscriptionid#" nameid="#nameid#" renewaldate="#renewaldate#">
						<cfinvoke component="#application.objsubscription#" method="addsubscriptionReminder" subscriptiondsn="#client.siteurl#" subscriptionid="#subscriptionid#" remindon="#renewaldate#">
					</cfif>
				</cfloop>
				<cfinvoke component="#application.objnewcart#" method="deletecart" cartdsn="#client.siteurl#" cartid="#url.c#">
			</cftransaction>
			<cfinclude template="/actions/tracking.cfm">
			<cfcatch type="any">
				<cfset client.message=cfcatch.message>
			</cfcatch>
		</cftry>
	</cfif>
<cfelse>
	<cfset client.message="There are no items in the cart">
</cfif>
<cflocation url="/cms/#url.section#/#url.module#/showcarts" addtoken="false">