<cfinclude template="validatecouponform.cfm">
<cfif thereAreNoErrorsInForm>
	<cfset coupons=ArrayNew(1)>
	<cfset args=structNew()>
	<cfset args.productdsn=client.siteurl>
	<cfset args.startdate=application.objtimedateconversion.dateToInt(form.startdate,form.starthour,form.starthour,form.startampm)>
	<cfset args.enddate=application.objtimedateconversion.dateToInt(form.enddate,form.endhour,form.endminute,form.endampm)>
	<cfset args.couponCode=form.couponCode>
	<cfif Trim(form.discount) NEQ ''>
		<cfset args.discount=form.discount>
	<cfelse>
		<cfset args.discountpercent=form.discountpercent>
	</cfif>
	<cfif Trim(form.nooftimesallowed) NEQ "">
		<cfset args.nooftimesallowed=form.nooftimesallowed>
	</cfif>
	<cfswitch expression="#form.discountappliesto#">
		<cfcase value="1">
			<cfset args.totalprice=form.totalprice>
		</cfcase>
		<cfcase value="2,6">
			<cfset args.discountvideocategoryid=form.videocategoryid>
		</cfcase>
		<cfcase value="3,5">
			<cfset args.discountcategoryid=form.categoryid>
		</cfcase>
		<cfcase value="7,8">
			<cfset args.discountid=form.id>
		</cfcase>
	</cfswitch>
	<cftransaction>
		<cfinvoke component="#application.objproduct#" method="createRule" argumentcollection="#args#" returnvariable="ruleid">
		<cfset args.ruleid=ruleid>
		<cfloop from="1" to="#form.noofcoupon#" index="i">
			<cfinvoke component="#application.objproduct#" method="registercoupoun" argumentcollection="#args#" returnvariable="coupon">
			<cfset ArrayAppend(coupons,coupon)>
		</cfloop>
	</cftransaction>
	<cfinclude template="/actions/tracking.cfm">
	<cflocation url="/cms/#url.section#/#url.module#/showcoupons" addtoken="false">
<cfelse>
	<cflocation url="#CGI.HTTP_REFERER#" addtoken="false">
</cfif>