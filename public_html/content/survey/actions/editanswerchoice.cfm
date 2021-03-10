<cfinclude template="validateanswerchoiceform.cfm">
<cfif thereAreNoErrorsInForm>
	<cfset form.surveydsn=client.siteurl>
	<cfset form.newanswer=form.answerchoice>
	<cftransaction>
		<cfinvoke component="#application.objsurvey#" method="editanswerchoice" argumentcollection="#form#" returnvariable="answerchoiceid">
	</cftransaction>
	<cfinclude template="/actions/tracking.cfm">
	<cflocation url="/cms/#url.section#/#url.module#/showanswerchoices/?q=#form.questionid#" addtoken="false">
<cfelse>
	<cflocation url="#CGI.HTTP_REFERER#" addtoken="false">
</cfif>