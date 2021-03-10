<cfparam name="url.surveyid" default="0">
<cfparam name="url.p" default="0">
<cfoutput>
	<cfif isNumeric(url.surveyid) AND isNumeric(url.p) AND url.p GT 0 AND url.surveyid GT 0>
		<cfinvoke component="#Application.objsurvey#" method="getSurveyInfo" surveydsn="#client.siteurl#" surveyid="#url.surveyid#" returnvariable="surveyinfo">
		<cfif surveyinfo.recordcount GT 0>
			<cfinvoke component="#Application.objsurvey#" method="isThisAValidPeopleSurveyedId" surveydsn="#client.siteurl#" surveyid="#url.surveyid#" peoplesurveyedid="#url.p#" returnvariable="thisIsAValidPeopleSurveyedId">
			<cfif thisIsAValidPeopleSurveyedId>
				<cfinvoke component="#Application.objsurvey#" method="getPersonInfo" surveydsn="#client.siteurl#" surveyid="#url.surveyid#" peoplesurveyedid="#url.p#" returnvariable="personinfo">
				<cfinvoke component="#Application.objsurvey#" method="getsurveyquestions" surveydsn="#client.siteurl#" surveyid="#url.surveyid#" returnvariable="questions">
				<h1>Survey: #surveyinfo.surveyname#</h1>
				<cfif personinfo.recordcount GT 0 AND (Trim(personinfo.firstname) NEQ '' OR Trim(personinfo.lastname) NEQ '')>
				<h2>Person Surveyed: #personinfo.firstname# #personinfo.lastname#</h2>
				<cfelse>
				<h2>Person Surveyed: Annonymous</h2>
				</cfif>
				<cfif questions.recordcount GT 0>
					<ol>
						<cfloop query="questions">
							<li>#surveyquestion#</li>
							<cfinvoke component="#Application.objsurvey#" method="getMyResult" surveydsn="#client.siteurl#" peoplesurveyedid="#url.p#" questionid="#questionid#" returnvariable="myanswers">
							<ul>
								<cfloop query="myanswers">
									<li>#answer#</li>
								</cfloop>
								<cfinvoke component="#Application.objsurvey#" method="getmytextanswer" surveydsn="#client.siteurl#" questionid="#questionid#" peoplesurveyedid="#url.p#" returnvariable="myanswer">
								<cfif myanswer NEQ "no data" AND Trim(myanswer) NEQ ''>
									<li>#myanswer#</li>
								</cfif>
							</ul>
							<br />
						</cfloop>
					</ol>
				</cfif>
			<cfelse>
				<cflocation url="/cms/#url.section#/#url.module#" addtoken="false">
			</cfif>
		<cfelse>
			<cflocation url="/cms/#url.section#/#url.module#" addtoken="false">
		</cfif>
	<cfelse>
		<cflocation url="/cms/#url.section#/#url.module#" addtoken="false">
	</cfif>
</cfoutput>