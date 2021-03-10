<cfobject component="formvalidation" name="objformvalidation">
<cfset objformvalidation.set_rules('noofcoupon','No of coupon','required,numeric,max_value[20]')>
<cfset objformvalidation.set_rules('startdate','Start Date','required,date')>
<cfset objformvalidation.set_rules('starthour','Start Hour','required,numeric,max_value[12]')>
<cfset objformvalidation.set_rules('startminute','Start Minute','required,numeric,max_value[59]')>
<cfset objformvalidation.set_rules('enddate','End Date','required,date')>
<cfset objformvalidation.set_rules('endhour','End Hour','required,numeric,max_value[12]')>
<cfset objformvalidation.set_rules('nooftimesallowed','Number of times the coupoun can be used','required')>
<cfset objformvalidation.set_rules('discountpercent','Discount Percent','numeric,max_value[100],min_value[0]')>
<cfset objformvalidation.set_rules('discount','Discount Amount','numeric,min_value[0]')>
<cfif Trim(form.discountpercent) EQ '' AND Trim(form.discountpercent) EQ ''>
	<cfset objformvalidation.addError('Either discount percent or discount is required')>
</cfif>
<cfset objformvalidation.set_rules('discountappliesto','Discount Applies To','required,numeric,min_value[1],max_value[8]')>
<cfswitch expression="#form.discountappliesto#">
	<cfcase value="1">
		<cfset objformvalidation.set_rules('totalprice','Total should be greater than','required,numeric')>
	</cfcase>
	<cfcase value="2">
		<cfset objformvalidation.set_rules('videocategoryid','Category','required')>
	</cfcase>
	<cfcase value="7,8">
		<cfset objformvalidation.set_rules('id','Item','required')>
	</cfcase>
</cfswitch>
<cfinclude template="/actions/checkforerrorsinform.cfm">
