<cfparam name="form.comment" default="">
<cfif Trim(form.comment) EQ "">
	<cflocation url="#CGI.HTTP_REFERER#" addtoken="false">
</cfif>


<cfinvoke component="#application.objincident#" method="getincidents" incidentdsn="#thissite#" incidentid="#form.incidentid#" returnvariable="incident">
<cfinvoke component="#Application.abCFC#" method="getContactviaNameid" contactdsn="#application.masterdsn#" nameid="#incident.nameid#" returnvariable="mySiteUser">
<cfset timereported=incident.timereported>
<cfset reporteddate=Application.objtimedateconversion.convertDate(timereported,"mm/dd/yyyy")>
<cfset reportedtime=Application.objtimedateconversion.convertTime(timereported,"hh:mmtt")>

<cfset form.taskdsn=thissite>
<cfset form.createdby=client.masternameid>
<cfif isDefined('form.solution')><cfset form.sendemail=1></cfif>
<cftransaction>
<cfinvoke component="#application.objtaskmanagement#" method="addComment" argumentcollection="#form#" returnvariable="cid">
<cfset form.cid=cid>
<cfinvoke component="#application.objtaskmanagement#" method="setCommentsOnIncident" argumentcollection="#form#">

<cfif isDefined('form.solution')>
	<cfset request.stream="added a comment to an incident as the solution">
	<cfset form.status="Complete">
	<cfinvoke component="#application.objtaskmanagement#" method="addsolution" argumentcollection="#form#">
	<cfinvoke component="#application.objincident#" method="updateIncident" incidentdsn="#thissite#" incidentid="#form.incidentid#" statusid="2">
	<cfinvoke component="#application.objtaskmanagement#" method="getAllTasksOnIncident" argumentcollection="#form#" returnvariable="task">
	<cfif task.recordcount GT 0>
	<cfset form.tid=task.tid>
		<cfinvoke component="#application.objtaskmanagement#" method="setTaskStatus" argumentcollection="#form#">
	</cfif>
</cfif>
</cftransaction>

<cfif Application.objtextconversion.isEmail(Trim(mySiteUser.WEMAIL))>
    <cfset email = Trim(mySiteUser.WEMAIL)>
<cfelseif Application.objtextconversion.isEmail(Trim(mySiteUser.HEMAIL))>
    <cfset email = Trim(mySiteUser.hemail)>
<cfelseif Application.objtextconversion.isEmail(Trim(mySiteUser.MEMAIL))>
    <cfset email = Trim(mySiteUser.memail)>
<cfelseif Application.objtextconversion.isEmail(Trim(mySiteUser.OEMAIL))>
    <cfset email = Trim(mySiteUser.oemail)>
<cfelseif Application.objtextconversion.isEmail(Trim(mySiteUser.username))>
	<cfset email = Trim(mySiteUser.username)>
<cfelse>
    <cfset email = "no">
</cfif>

<cfif email NEQ "no">
	<cfif isDefined('form.solution')>
		<cfmail from="support@quantumdelta.com" bcc="support@quantumdelta.com" to="#email#" subject="Your Incident resolved." type="html">
			Dear #mySiteUser.firstname# #mySiteUser.Lastname#, <br /><br />
			The incident #incident.incidentname# you had reported on #reporteddate# #reportedtime# has been resolved. <br /> <br />
			<b>Incident Description</b><br /><br />
			#REReplace(Application.objtextconversion.stripHTML(incident.incidentdescription),"#chr(10)#","<br />","All")# <br /><br />
			The solution to the problem has been explained below.
			<br /> <br />
			<strong>Solution:</strong> <br />
			
			#REReplace(Application.objtextconversion.stripHTML(form.comment),"#chr(10)#","<br />","All")# <br /> <br />
			
			Thank you <br />
			Quantum Delta Team
		</cfmail>
	<cfelse>
		<cfinvoke component="#application.abCFC#" method="getcontactinfo" contactdsn="#application.masterdsn#" nameid="#client.masternameid#" returnvariable="me">
		<cfset myname="#me.firstname# #me.lastname#">
		<cfmail from="support@quantumdelta.com" to="#email#" bcc="support@quantumdelta.com" subject="Comment added to your incident" type="html">
			Dear #mySiteUser.firstname# #mySiteUser.lastname#, <br /><br />
			#myname# made comment on the incident #incident.incidentname# you had reported on #reporteddate# #reportedtime#. <br /> <br />
			<b>Incident Description</b><br /><br />
			#REReplace(Application.objtextconversion.stripHTML(incident.incidentdescription),"#chr(10)#","<br />","All")# <br /><br />
			Below is the comment added to the incident. <br /><br />
			<b>Comment:</b><br />
			#REReplace(Application.objtextconversion.stripHTML(form.comment),"#chr(10)#","<br />","All")# <br /><br />
			Thank you <br />
			support@quantumdelta.com
		</cfmail>
	</cfif>
<cfelse>
	<cfmail from="support@quantumdelta.com" to="binod@quantumdelta.com" subject="dude, I could not send email" type="html">
		Dude i was trying to send email to #mySiteUser.firstname# #mySiteUser.Lastname# but i could not send it. Here is his/her email
		information. <br />
		Username: #mysiteuser.wemail# <br />
		Hemail: #mysiteuser.hemail# <br />
		Wemail: #mysiteuser.memail# <br />
		Memail: #mysiteuser.memail# <br />
		Oemail: #mySiteuser.oemail# <br /> <br />
		Good luck debugging dude.
	</cfmail>
</cfif>
<cfoutput>
	<cflocation url="/cms/taskmgmt/troubleticket/showincident/?incidentid=#form.incidentid#" addtoken="false">
</cfoutput>