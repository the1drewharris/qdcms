<cfinclude template="validatequestionform.cfm">
<cfif thereAreNoErrorsInForm>
	<cfset form.surveydsn=client.siteurl>
	<cfif isDefined('form.disabled')>
		<cfif form.disabled EQ 1>
			<cfset form.display=0>
		</cfif>
	</cfif>
	<cftransaction>
		<cfinvoke component="#application.objsurvey#" method="addquestion" argumentcollection="#form#" returnvariable="questionid">
	</cftransaction>
	<cfinclude template="/actions/tracking.cfm">
	<cflocation url="/cms/content/survey/questions/?surveyid=#form.surveyid#" addtoken="false">
<cfelse>
	<cflocation url="#CGI.http_referer#" addtoken="false">
</cfif>