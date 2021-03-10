<cfparam name="url.surveyid" default="0">
<cfif isNumeric(url.surveyid) AND url.surveyid NEQ 0>
	<cfset r=Application.objsurvey.deleteSurvey(client.siteurl,url.surveyid)>
	<cfif r EQ 1>
		<cfset client.message="The survey has been deleted">
		<cfinclude template="/actions/tracking.cfm">
	<cfelseif r EQ 0>
		<cfset client.message="The survey can not be deleted. Please make sure the survey is empty">
	<cfelseif r EQ -1>
		<cfset client.message="Invalid survey">
	</cfif>
<cfelse>
	<cfset client.message="Invalid survey">
</cfif>
<cflocation url="#CGI.HTTP_REFERER#" addtoken="false">