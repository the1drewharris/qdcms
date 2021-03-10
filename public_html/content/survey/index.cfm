<cfswitch expression="#url.action#">
	<cfcase value="actionaddsurvey">
		<cfset request.stream="added a survey">
		<cfinclude template="actions/addsurvey.cfm">
	</cfcase>
	<cfcase value="actioneditsurvey">
		<cfset request.stream="edited a survey">
		<cfinclude template="actions/editsurvey.cfm">
	</cfcase>
	<cfcase value="actionaddquestion">
		<cfset request.stream="added a question to a survey">
		<cfinclude template="actions/addquestion.cfm">
	</cfcase>
	<cfcase value="actioneditquestion">
		<cfset request.stream="edited a question on a survey">
		<cfinclude template="actions/editquestion.cfm">
	</cfcase>
	<cfcase value="actionaddanswerchoice">
		<cfset request.stream="added a choice for an answer to a question on a survey">
		<cfinclude template="actions/addanswerchoice.cfm">
	</cfcase>
	<cfcase value="actioneditanswerchoice">
		<cfset request.stream="edited an answer choice to a question of a survey">
		<cfinclude template="actions/editanswerchoice.cfm">
	</cfcase>
	<cfcase value="actiondeletesurvey">
		<cfset request.stream="deleted a survey">
		<cfinclude template="actions/deletesurvey.cfm">
	</cfcase>
	<cfcase value="actiondeletequestion">
		<cfset request.stream="deleted question(s)">
		<cfinclude template="deletequestions.cfm">
	</cfcase>
	<cfcase value="actionsortquestions">
		<cfset request.stream="sorted questions">
		<cfinclude template="actions/sortquestions.cfm">
	</cfcase>
	<cfcase value="actionaddrelatedquestion">
		<cfset request.stream="added a related question">
		<cfinclude template="actions/addrelatedquestion.cfm">
	</cfcase>
	<cfcase value="actioneditrelatedquestion">
		<cfset request.stream="edited a related question">
		<cfinclude template="actions/editrelatedquestion.cfm">
	</cfcase>
	<cfcase value="populateanswerchoices">
		<cfset request.stream="populated answer choices/options">
		<cfinclude template="display/populateanswerchoices.cfm">
	</cfcase>
	<cfcase value="deletesurvey">
		<cfset request.stream="deleted a survey">
		<cfinclude template="actions/deletesurvey.cfm">
	</cfcase>
	<cfcase value="deleterelation">
		<cfset request.stream="deleted a relationship between two questions">
		<cfinclude template="actions/deleterelation.cfm">
	</cfcase>
	<cfdefaultcase>
		<cfset request.stream=0>
		<cfinclude template="layout/default.cfm">
	</cfdefaultcase>
</cfswitch>