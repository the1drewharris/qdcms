<cfinclude template="validatequestionform.cfm">
<cfif thereAreNoErrorsInForm>
	<cfset form.surveydsn=client.siteurl>
	<cfset form.newquestion=form.question>
	<cfif isDefined('form.disabled')>
		<cfif form.disabled EQ 1>
			<cfset form.display=0>
		<cfelse>
			<cfset form.display=1>
		</cfif>
	</cfif>
	<cftransaction>
		<cfinvoke component="#application.objsurvey#" method="editQuestion" argumentcollection="#form#">
		<cfinvoke component="#application.objsurvey#" method="getSurveyid" surveydsn="#client.siteurl#" questionid="#form.questionid#" returnvariable="surveyid">
	</cftransaction>
	<cfinclude template="/actions/tracking.cfm">
	<cflocation url="/cms/content/survey/questions/?surveyid=#surveyid#">
<cfelse>
	<cflocation url="#CGI.http_referer#" addtoken="false">
</cfif>