<cfparam name="url.surveyid" default="0">
<cfif isNumeric(url.surveyid) AND url.surveyid GT 0>
	<cfinvoke component="#application.objsurvey#" method="getSurveyInfo" surveydsn="#client.siteurl#" surveyid="#url.surveyid#" returnvariable="surveyinfo">
	<cfinvoke component="#application.objsurvey#" method="getAllPeopleSurveyed" surveydsn="#client.siteurl#" surveyid="#url.surveyid#" returnvariable="peoplesurveyed">
</cfif>
<cfoutput>
	<cfif peoplesurveyed.recordcount GT 0>
	<h3>List of people surveyed for #surveyinfo.surveyname#</h3>
	<table class="datagrid" id="managePagesTable">
		<tr class="titlebar">
			<th>Name</th>
			<th></th>
		</tr>
		<cfloop query="peoplesurveyed">
			<cfif currentRow MOD 2 EQ 0>
				<tr class="alt">
			<cfelse>
				<tr>
			</cfif>
			<td>
				<cfif firstname NEQ '' OR lastname NEQ ''>
					#firstname# #lastname#
				<cfelse>
					No Name
				</cfif>	
			</td>
			<td><a href="/cms/#url.section#/#url.module#/showindividualreport/?surveyid=#url.surveyid#&p=#PEOPLESURVEYEDID#">View </td>
		</cfloop>
	</table>
	<cfelse>
		<div class="quicknote">
			<h2>No one have been surveyed for Survey: #surveyinfo.surveyname#</h2>
		</div>
	</cfif>
</cfoutput>