<cfoutput>
	<cfinvoke component="#application.objsurvey#" method="getrelatedquestions" surveydsn="#client.siteurl#" surveyid="#url.surveyid#" returnvariable="relatedquestions">
	<cfif relatedquestions.recordcount GT 0>
		<h1 style="float:left">#title#</h1>
		<span class="left">
			<a href="" id="deleterelation" title="Delete checked relation">Delete</a>
		</span>
			
		<span class="right">
			<a href="/cms/#url.section#/#url.module#/addrelatedquestion/?surveyid=#url.surveyid#">+ Add Related Question</a>
		</span>
		<table class="datagrid" id="managePagesTable">
			<tr class="titlebar">
				<th class="checkbox"><input id="selectAll" type="checkbox"></th>
				<th>Question</th>
				<th>Answer</th>
				<th>Related Question</th>
				<th width="50"></th>
			</tr>
			<cfset currentrow=0>
			<cfloop query="relatedquestions">
				<cfif currentrow MOD 2 EQ 0><tr class="alt"><cfelse><tr></cfif>
					<td><input type="checkbox" id="survey#qrelationid#"></td>
					<td>#surveyquestion#</td>
					<td>#answer#</td>
					<td>#related_question#</td>
					<td><a href="/cms/#url.section#/#url.module#/editrelatedquestion/?r=#qrelationid#">Edit</a></td>
				</tr>
			</cfloop>
		</table>
	<cfelse>
		<div class="quicknote">
			<h1>There are no related question for this survey.</h1>
		</div>
	</cfif>
</cfoutput>