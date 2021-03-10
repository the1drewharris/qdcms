<cfif NOT thereAreErrors>
	<cfinvoke component="#Application.objsurvey#" method="getsurveyinfo" returnvariable="surveyinfo" surveydsn="#client.siteurl#" surveyid="#url.surveyid#">
	<cfset session.formvalues['surveyid']=url.surveyid>
	<cfset session.formvalues['surveyname']=surveyinfo.surveyname>
	<cfset session.formvalues['allowenddate']=surveyinfo.allowenddate>
	<cfset session.formvalues['active']=surveyinfo.active>
	<cfset session.formvalues['numberoftimesfor1ip']=surveyinfo.numberoftimesfor1ip>
	<cfset session.formvalues['numberoftimesfornameid']=surveyinfo.numberoftimesfornameid>
	<cfset session.formvalues['sdate']=application.objtimedateconversion.convertDate(surveyinfo.startdate,'yyyy/mm/dd')>
	<cfset session.formvalues['starthour']=mid(surveyinfo.startdate,9,2)>
	<cfif session.formvalues['starthour'] GTE 12>
		<cfset session.formvalues['startampm']='PM'>
		<cfif session.formvalues['starthour'] GT 12>
			<cfset session.formvalues['starthour']=session.formvalues['starthour']-12>
		</cfif>
	<cfelse>
		<cfset session.formvalues['startampm']='AM'>
	</cfif>
	
	<cfset session.formvalues['startminute']=mid(surveyinfo.startdate,11,2)>
	
	<cfset session.formvalues['edate']=application.objtimedateconversion.convertdate(surveyinfo.enddate,'yyyy/mm/dd')>
	<cfset session.formvalues['endhour']=mid(surveyinfo.enddate,9,2)>
	<cfif session.formvalues['endhour'] GTE 12>
		<cfset session.formvalues['endampm']='PM'>
		<cfif session.formvalues['endhour'] GT 12>
			<cfset session.formvalues['endhour']=session.formvalues['endhour']-12>
		</cfif>
	<cfelse>
		<cfset session.formvalues['endampm']='AM'>
	</cfif>
	<cfset session.formvalues['endminute']=mid(surveyinfo.enddate,11,2)>
</cfif>