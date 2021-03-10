<cfinclude template="validateform.cfm">
<cfif thereAreNoErrorsInForm>
	<cfset args=structNew()>
	<cfset args.startdate = "#Application.objtimedateconversion.datetoInt(form.startdate,form.starthour,startminute,form.startampm)#">
	<cfset args.enddate = "#Application.objtimedateconversion.datetoInt(form.enddate,form.endhour,form.endminute,form.endampm)#">
	
	<cfif isDefined('form.answerrequired')>
		<cfset args.answerrequired=1>
	<cfelse>
		<cfset args.answerrequired=0>
	</cfif>
	
	<cfif isDefined('form.imagerequired')>
		<cfset args.imagerequired=1>
	<cfelse>
		<cfset args.imagerequired=0>
	</cfif>
	
	<cfif isDefined('form.videorequired')>
		<cfset args.videorequired=1>
	<cfelse>
		<cfset args.videorequired=0>
	</cfif>
	
	<cfset args.contestdsn=client.siteurl>
	<cfset args.nameid=client.masternameid>
	<cfset args.question=form.question>
	<cfset args.longdescription=form.longdescription>
	<cfset args.description=form.description>
	<cftransaction>
		<cfinvoke component="#Application.objcontest#" method="addcontest" returnvariable="contestid" argumentcollection="#args#">
	</cftransaction>
	<cfinclude template="/actions/tracking.cfm">
	<cflocation url="/cms/content/contest/showcontests" addtoken="false">
<cfelse>
	<cflocation url="#CGI.HTTP_REFERER#" addtoken="false">
</cfif>