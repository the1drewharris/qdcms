<cfif NOT thereAreErrors>
	<cfparam name="url.q" default="0">
	<cfinvoke component="#application.objsurvey#" method="getSingleQuestion" surveydsn="#client.siteurl#" questionid="#url.q#" returnvariable="thisquestion">
	<cfif thisquestion.recordcount GT 0>
		<cfset url.surveyid=thisquestion.SURVEYID>
		<cfset session.formvalues['question']=thisquestion.SURVEYQUESTION>
		<cfset session.formvalues['multipleanswers']=thisquestion.MULTIPLEANSWERS>
		<cfset session.formvalues['textrequired']=thisquestion.TEXTREQUIRED>
		<cfif thisquestion.display EQ 0>
			<cfset session.formvalues['disabled']=1>
		</cfif>
	<cfelse>
		<cflocation url="/cms/content/survey/showsurveys" addtoken="false">
	</cfif>
</cfif>