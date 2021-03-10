<cfif NOT thereAreErrors>
	<cfparam name="url.contestid" default="0">
	<cfinvoke component="#application.objcontest#" method="getcontest" contestdsn="#client.siteurl#" contestid="#url.contestid#" returnvariable="mycontest">
	<cfif mycontest.recordcount GT 0>
		<cfset session.formValues['contestid']=url.contestid>
		<cfset session.formValues['question']=mycontest.question>
		<cfset session.formValues['description']=mycontest.description>
		<cfset session.formValues['longdescription']=mycontest.longdescription>
		<cfset session.formValues['startdate']=Application.objtimedateconversion.convertdate(mycontest.startdate,"mm/dd/yyyy")>
		<cfset session.formValues['starthour']=Application.objtimedateconversion.getdatepart(mycontest.startdate,'h')>
		<cfset session.formValues['startminute']=Application.objtimedateconversion.getdatepart(mycontest.startdate,'n')>
		<cfif session.formValues['starthour'] GT 12>
			<cfset session.formValues['starthour']=session.formValues['starthour']-12>
			<cfif session.formValues['starthour'] LT 10>
				<cfset session.formValues['starthour']="0#session.formValues['starthour']#">
			</cfif>
			<cfset session.formValues['startampm']="PM">
		<cfelse>
			<cfset session.formValues['startampm']="AM">
		</cfif>
		
		<cfset session.formValues['enddate']=Application.objtimedateconversion.convertdate(mycontest.enddate,"mm/dd/yyyy")>
		<cfset session.formValues['endhour']=Application.objtimedateconversion.getdatepart(mycontest.enddate,'h')>
		<cfset session.formValues['endminute']=Application.objtimedateconversion.getdatepart(mycontest.enddate,'n')>
		<cfif session.formValues['endhour'] GT 12>
			<cfset session.formValues['endhour']=session.formValues['endhour']-12>
			<cfif session.formValues['endhour'] LT 10>
				<cfset session.formValues['endhour']="0#session.formValues['endhour']#">
			</cfif>
			<cfset session.formValues['endampm']="PM">
		<cfelse>
			<cfset session.formValues['endampm']="AM">
		</cfif>
		
		<cfset session.formValues['answerrequired']=mycontest.answerrequired>
		<cfset session.formValues['imagerequired']=mycontest.imagerequired>
		<cfset session.formValues['videorequired']=mycontest.videorequired>
		
		<cfinvoke component="#Application.objcontest#" method="isContestEmpty" contestdsn="#client.siteurl#" contestid="#url.contestid#" returnvariable="contestIsEmpty">
		<cfif NOT contestIsEmpty>
			<cfset title="View Contest">
		</cfif>
	<cfelse>
		<cflocation url="/cms/content/contest/showcontests" addtoken="false">
	</cfif>
</cfif>