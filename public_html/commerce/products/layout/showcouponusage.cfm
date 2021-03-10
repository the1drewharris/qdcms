<cfoutput>
	<cfset request.validationtext="">
	<cfinvoke component="#application.objproduct#" method="checkCoupoun" productdsn="#client.siteurl#" returnvariable="ruleid" coupoun="#url.coupon#">
	<cfquery name="getPercent" datasource="#client.siteurl#">
	SELECT 
		IFTABLE.STARTDATE, 
		IFTABLE.ENDDATE,
		THENTABLE.CATEGORYID,
		THENTABLE.ID,
		THENTABLE.QUANTITY,
		THENTABLE.DISCOUNTPERCENT,
		THENTABLE.DISCOUNT,
		COUPOUN.NOOFTIMESALLOWED  
	FROM IFTABLE, THENTABLE, COUPOUN
	WHERE COUPOUN.COUPOUN = '#url.coupon#'
	AND	IFTABLE.RULEID=THENTABLE.RULEID
	AND COUPOUN.RULEID=IFTABLE.RULEID
</cfquery>
<!---ID in the query above is the product id, you should check this against the id's of the items within the cart --->

<cfif getPercent.recordcount eq 1>
	<cfif getPercent.discountpercent neq 0>
		<cfif getPercent.id eq "">
			<cfset request.discountPercent=getPercent.discountpercent>
			<cfset request.itemDiscountPercent=0>
			<cfset request.itemDiscountID=0>
		<cfelse>
			<cfset request.discountPercent=0>
			<cfset request.itemDiscountPercent=getPercent.discountpercent>
			<cfset request.itemDiscountID=getPercent.ID>
		</cfif>
	</cfif>
	
</cfif>	

<cfswitch expression="#ruleid#">
	
	<cfcase value="-2">
		<cfset request.validationtext=listappend(request.validationtext,"The coupon you tried to use has expired.")>
		<cfset request.discountPercent=0>
	</cfcase>
	
	<cfcase value="-1">
		<cfset request.validationtext=listappend(request.validationtext,"The coupon you tried to use is invalid.")>
		<cfset request.discountPercent=0>
		
	</cfcase>
	
	<cfcase value="0">
		<cfset request.validationtext=listappend(request.validationtext,"The coupon you tried to use has exceeded it's maximum number of uses.")>
		<cfset request.discountPercent=0>
	</cfcase>
	
	<cfdefaultcase>
		<cfset request.validationtext=listappend(request.validationtext,"Valid Active Coupon.")>
		<cfset request.discountPercent=getPercent.discountpercent>
	</cfdefaultcase>
	
</cfswitch>
		
	
	<cfinvoke component="#application.objproduct#" method="getCoupounUsage" productdsn="#client.siteurl#" coupoun="#url.coupon#" returnvariable="usage">
	
		<h1>#url.coupon#</h1>
			<p>
			#request.validationtext#
			</p>
			<p>
			Cateogryid: #getpercent.categoryid# | Discount Percent: #getPercent.discountpercent# | Product ID: #getPercent.id# | Number of times Allowed: #getPercent.nooftimesallowed# | #getPercent.startdate# - #getPercent.enddate#
			</p>
		<h2>Usage</h2>
		<span class="right"><a href="/cms/#url.section#/#url.module#/addcoupon">+Add Coupon</a></span>
		<table class="datagrid" id="managePagesTable">
			<tr class="titlebar">
				<th>Time-Date</th>
				<th>First Name</th>
				<th>Last Name</th>
			</tr>
			<cfloop query="usage">
				<cfif currentRow MOD 2 EQ 0>
					<tr class="alt">
				<cfelse>
					<tr>
				</cfif>
				<td>#timedate#</td>
				<td><a href="/cms/crm/addressbook/editcontact/?id=#nameid#" target="_blank">#firstname#</a></td>
				<td><a href="/cms/crm/addressbook/editcontact/?id=#nameid#" target="_blank">#lastname#</a></td>
		  		</tr>
			</cfloop>
		</table>
	
</cfoutput>