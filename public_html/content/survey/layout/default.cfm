<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<cfoutput>
	<html xmlns="http://www.w3.org/1999/xhtml">
		<head>
			<cfinclude template="/includes/titleAndMeta.cfm">
			<cfinclude template="/includes/selectivecss.cfm">
		</head>
		<body>
			<cfinclude template="/display/header.cfm">
			<div class="clear"></div>
			<div id="content-bg">
				<div id="content">
					<cfinclude template="../display/submenuNavigation.cfm">
					<cfinclude template="/display/errors.cfm">
					<cfswitch expression="#url.action#">
						<cfcase value="addsurvey">
							<cfset title="Add Survey">
							<cfset formaction="actionaddsurvey">
							<cfinclude template="addeditsurvey.cfm">
						</cfcase>
						<cfcase value="editsurvey">
							<cfset title="Edit Survey">
							<cfset formaction="actioneditsurvey">
							<cfinclude template="../includes/surveyinfo.cfm">
							<cfinclude template="addeditsurvey.cfm">
						</cfcase>
						<cfcase value="showsurvey">
							<cfinclude template="showsurvey.cfm">
						</cfcase>
						<cfcase value="addquestion">
							<cfset title="Add Question">
							<cfset formaction="actionaddquestion">
							<cfinclude template="addeditquestion.cfm">
						</cfcase>
						<cfcase value="editquestion">
							<cfset title="Edit Question">
							<cfset formaction="actioneditquestion">
							<cfinclude template="../includes/questioninfo.cfm">
							<cfinclude template="addeditquestion.cfm">
						</cfcase>
						<cfcase value="questions">
							<cfinclude template="../includes/showquestionsinfo.cfm">
							<cfinclude template="showquestions.cfm">
						</cfcase>
						<cfcase value="addanswerchoice">
							<cfset title="Add Answer Choice">
							<cfset formaction="actionaddanswerchoice">
							<cfinclude template="../includes/answerchoiceinfo.cfm">
							<cfinclude template="addeditanswerchoice.cfm">
						</cfcase>
						<cfcase value="showanswerchoices">
							<cfinclude template="showanswerchoices.cfm">
						</cfcase>
						<cfcase value="editanswerchoice">
							<cfset title="Edit Answer Choice">
							<cfset formaction="actioneditanswerchoice">
							<cfinclude template="../includes/answerchoiceinfo.cfm">
							<cfinclude template="addeditanswerchoice.cfm">
						</cfcase>
						<cfcase value="showrelatedquestions">
							<cfset title="Related Question">
							<cfset formaction="actiondeleterelatedquestions">
							<cfinclude template="relatedquestions.cfm">
						</cfcase>
						<cfcase value="addrelatedquestion">
							<cfset title="Add Related Question">
							<cfset formaction="actionaddrelatedquestion">
							<cfinclude template="addrelatedquestion.cfm">
						</cfcase>
						<cfcase value="editrelatedquestion">
							<cfset title="Edit Related Question">
							<cfset formaction="actioneditrelatedquestion">
							<cfinclude template="editrelatedquestion.cfm">
						</cfcase>
						<cfcase value="showreport">
							<cfinclude template="showreport.cfm">
						</cfcase>
						<cfcase value="showtextanswers">
							<cfinclude template="showtextanswers.cfm">
						</cfcase>
						<cfcase value="showpeoplesurveyed">
							<cfinclude template="showpeoplesurveyed.cfm">
						</cfcase>
						<cfcase value="showindividualreport">
							<cfinclude template="individualreport.cfm">
						</cfcase>
						<cfdefaultcase>
							<cflocation url="/cms/content/survey/showsurvey" addtoken="false">
						</cfdefaultcase>
					</cfswitch>
				</div>
			</div>
			<div class="clear"></div>
			<cfinclude template="/display/footer.cfm">
			<cfinclude template="/includes/selectivejs.cfm">
		</body>
	</html>
</cfoutput>