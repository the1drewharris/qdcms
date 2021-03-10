<cfparam name="url.s" default="0">
<cfif isNumeric(url.s) AND url.s GTE 1>
	<cfset args=StructNew()>
	<cfset args.subscriptiondsn=client.siteurl>
	<cfset args.subscriptionid=url.s>
	<cfset args.nameid=application.objsubscription.getSubscriber(client.siteurl,url.s)>
	<cfif args.nameid NEQ ''>
		<cfset oldrenewaldate=application.objsubscription.getrenewaldate(client.siteurl,url.s)>
		<cfset tempdate=application.objtimedateconversion.stringToDate(oldrenewaldate)>
		<cfset subscriptionplanid=application.objsubscription.getsubscriptionPlanID(client.siteurl,url.s)>
		<cfif tempdate LT now()><cfset tempdate=now()></cfif>
		<cfset plan=application.objsubscription.getsubscriptionplans(client.siteurl,subscriptionplanid)>
		
		<cfswitch expression="#plan.termmeasure#">
			<cfcase value="Minutes">
				<cfset tempdate=DateAdd("n",plan.term,tempdate)>
			</cfcase>
			<cfcase value="Hours">
				<cfset tempdate=DateAdd("h",plan.term,tempdate)>
			</cfcase>
			<cfcase value="Days">
				<cfset tempdate=DateAdd("d",plan.term,tempdate)>
			</cfcase>
			<cfcase value="Weeks">
				<cfset tempdate=DateAdd("ww",plan.term,tempdate)>
			</cfcase>
			<cfcase value="Months">
				<cfset tempdate=DateAdd("m",plan.term,tempdate)>
			</cfcase>
			<cfcase value="Years">
				<cfset tempdate=DateAdd("yyyy",plan.term,tempdate)>
			</cfcase>
		</cfswitch>
		
		<cfset args.renewaldate="#DateFormat(tempdate,'yyyymmdd')##timeformat(tempdate,'HHmmss')#00">
		<cfset args.remindon=args.renewaldate>
		<cfset args.remindermeasure='Email'>
		
		<cftransaction>
			<cfinvoke component="#application.objsubscription#" method="addsubscription" argumentcollection="#args#">
			<cfinvoke component="#application.objsubscription#" method="activatesubscription" argumentcollection="#args#">
			<cfinvoke component="#application.objsubscription#" method="addsubscriptionReminder" argumentcollection="#args#">
		</cftransaction>
		<cfinclude template="/actions/tracking.cfm">
	</cfif>
</cfif>
<cflocation url="#CGI.HTTP_REFERER#" addtoken="false">