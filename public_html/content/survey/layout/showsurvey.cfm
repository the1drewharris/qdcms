<cfoutput>
	<cfinvoke component="#Application.objsurvey#" method="getsurveys" returnvariable="mysurveys" surveydsn="#client.siteurl#" all=1>
	<cfif mysurveys.recordcount EQ 0>
		<div class="quicknote">
			<h1>There are currently no Surveys for this site. 
			<a href="/cms/content/survey/addsurvey">Click here</a> to add your first Survey!</h1>
			<p>It is really easy!</p>
		</div>
	<cfelse>
		<h1 style="float:left">Survey</h1>
		<span class="left"></span>
		<span class="right">
			<a href="/cms/content/survey/addsurvey" id="addSurvey" title="Add new survey">+ Add Survey</a>
		</span>
	
		<table class="datagrid" id="managePagesTable">
			<tr class="titlebar">
				<th>Survey Name</th>
				<th>Start</th>
				<th>End</th>
				<th>Question Options</th>
				<th>Related Questions</th>
				<th>People Surveyed</th>
				<th></th>
			</tr>
			<cfloop query="mysurveys">
				<cfif currentRow MOD 2 NEQ 0><tr class="alt"><cfelse><tr></cfif>
					<td><a href="/cms/content/survey/editsurvey/?surveyid=#surveyid#">#surveyname#</a></td>
					<cfset start_date=Application.objtimedateconversion.convertDate(startdate,"mm/dd/yyyy")>
					<cfset starttime=Application.objtimedateconversion.convertTime(startdate,"hh:mmtt")>
					<td>#start_date# #starttime#</td>
					<cfset end_date=Application.objtimedateconversion.convertDate(enddate,"mm/dd/yyyy")>
					<cfset endtime=Application.objtimedateconversion.convertTime(enddate,"hh:mmtt")>
					<td>#end_date# #endtime#</td>
					<td>
						<a href="/cms/content/survey/addquestion/?surveyid=#surveyid#">Add</a> 
						<cfif noofquestions GT 0>
						| <a href="/cms/content/survey/questions/?surveyid=#surveyid#">Show</a>
						</cfif>
					</td>
					<td>
						<a href="/cms/content/survey/addrelatedquestion/?surveyid=#surveyid#">Add</a>
						<cfset surveyHasRelatedQuestion=application.objsurvey.doesSurveyHasRelatedQuestion(client.siteurl,surveyid)>
						<cfif surveyHasRelatedQuestion>| <a href="/cms/content/survey/showrelatedquestions/?surveyid=#surveyid#">Show</a></cfif>
					</td>
					<td><a href="/cms/content/survey/showpeoplesurveyed/?surveyid=#surveyid#">Show</a></td>
					<td>
						<cfif NOOFQUESTIONS GT 0>
							<a href="/cms/content/survey/showreport/?surveyid=#surveyid#">Report</a>
						<cfelse>
							<a href="/cms/content/survey/deletesurvey/?surveyid=#surveyid#">Delete</a>
						</cfif>
					</td> 
				</tr>
			</cfloop>	
		</table>
	</cfif>
</cfoutput>