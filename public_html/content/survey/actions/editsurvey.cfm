<cfinclude template="validatesurveyform.cfm">
<cfif thereAreNoErrorsInForm>
	<cfset form.startdate = application.objtimedateconversion.dateToInt(form.sdate,form.starthour,form.startminute,form.startampm)>
	<cfset form.enddate = application.objtimedateconversion.dateToInt(form.edate,form.endhour,form.endminute,form.endampm)>
	<cftransaction>
		<cfinvoke component="#Application.objsurvey#" method="editsurvey" argumentcollection="#form#" surveydsn="#client.siteurl#">
	</cftransaction>
	<cfinclude template="/actions/tracking.cfm">
	<cflocation url="/cms/content/survey/showsurvey" addtoken="false">
<cfelse>
	<cflocation url="#CGI.http_referer#" addtoken="false">
</cfif>