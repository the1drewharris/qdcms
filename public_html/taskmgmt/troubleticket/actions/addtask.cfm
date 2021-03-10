<cfset args=StructNew()>
<cfset args.taskdsn=thissite>
<cfset args.tname=form.tname>
<cfset args.task_type=form.task_type>
<cfset args.task_description=form.task_description>
<cfset args.est_mins=form.est_mins>
<cfset args.fee=form.fee>
<cfset args.status="Recorded">
<cfset args.priority=0>
<cfinvoke component="#application.objincident#" method="getincidents" incidentdsn="#thissite#" incidentid="#form.incidentid#" returnvariable="incident">
<cfset timereported=incident.timereported>
<cfset reporteddate=Application.objtimedateconversion.convertDate(timereported,"mm/dd/yyyy")>
<cfset reportedtime=Application.objtimedateconversion.convertTime(timereported,"hh")>
<cfset reportedtime=reportedtime & ":" & Application.objtimedateconversion.convertTime(timereported,"mm")>
<cfset ampm=Application.objtimedateconversion.convertTime(timereported,"tt")>
<cfif ampm eq "pm">
	<cfset reportedtime=reportedtime & " " & "PM">
<cfelse>
	<cfset reportedtime=reportedtime & " " & "AM">
</cfif>	

<cfinvoke component="#Application.abCFC#" method="getContactviaNameid" contactdsn="#application.masterdsn#" nameid="#incident.nameid#" returnvariable="mySiteUser">
<cftransaction>
	<cfinvoke component="#application.objtaskmanagement#" method="addTask" returnvariable="tid" argumentcollection="#args#">
	<cfset args.tid=tid>
	<cfset args.incidentid=form.incidentid>
	<cfinvoke component="#application.objtaskmanagement#" method="setTaskonIncident" argumentcollection="#args#">
	<cfinvoke component="#application.objtaskmanagement#" method="setTaskStatus" argumentcollection="#args#">
	<cfinvoke component="#application.objtaskmanagement#" method="setTaskPriority" argumentcollection="#args#">
	
	<cfinvoke component="#application.objincident#" method="updateIncident" incidentdsn="#thissite#" incidentid="#form.incidentid#" statusid="1">
	
	<cfif Application.objtextconversion.isEmail(mySiteUser.WEMAIL)>
	    <cfset email = mySiteUser.WEMAIL>
	<cfelseif Application.objtextconversion.isEmail(mySiteUser.HEMAIL)>
	    <cfset email = mySiteUser.hemail>
	<cfelseif Application.objtextconversion.isEmail(mySiteUser.MEMAIL)>
	    <cfset email = mySiteUser.memail>
	<cfelseif Application.objtextconversion.isEmail(mySiteUser.OEMAIL)>
	    <cfset email = mySiteUser.oemail>
	<cfelse>
	    <cfset email = "no">
	</cfif>
	
	<cfif email NEQ "no">
		<cfmail from="support@quantumdelta.com" to="#email#" bcc="support@quantumdelta.com" subject="Your incident status" type="html">
			Dear Mr/Ms #mySiteUser.Lastname#, <br /><br />
			The status of the incident #incident.incidentname# you had reported on #reporteddate# #reportedtime# has been changed to <b>In Process</b>. <br /> <br />
			<b>Incident Description</b><br /><br />
			#REReplace(Application.objtextconversion.stripHTML(incident.incidentdescription),"#chr(10)#","<br />","All")# <br /><br />
			Thank you <br />
			support@quantumdelta.com
		</cfmail>
	</cfif>
</cftransaction>
<cflocation url="/cms/taskmgmt/troubleticket/showincidents" addtoken="false">