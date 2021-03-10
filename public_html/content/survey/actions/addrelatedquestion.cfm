<cfset form.surveydsn=client.siteurl>
<cftransaction>
	<cfinvoke component="#application.objsurvey#" method="addrelatedquestion" argumentcollection="#form#">
</cftransaction>
<cfinclude template="/actions/tracking.cfm">
<cflocation url="/cms/#url.section#/#url.module#/showrelatedquestions/?surveyid=#form.surveyid#" addtoken="false">