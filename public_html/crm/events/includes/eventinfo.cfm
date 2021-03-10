<cfset repeatingEvent=FALSE>
<cfinvoke component="#Application.objevent#" method="getEventInfo" eventdsn="#client.siteurl#" eventinstanceid="#url.eventid#" returnvariable="eventinfo">
<cfinvoke component="#Application.objevent#" method="getRepeatingEventInfo" eventdsn="#client.siteurl#" eventinstanceid="#url.eventid#" returnvariable="repeatingeventinfo">
<cfquery name="thisevent" dbtype="query">
	SELECT 
		EVENTINFO.EVENTURL,
		EVENTINFO.CONTACTID,
		EVENTINFO.LOCATIONID,
		EVENTINFO.EVENTID, 
		EVENTINFO.EVENTNAME,  
		EVENTINFO.STATUS, 
		EVENTINFO.DESCRIPTION, 
		EVENTINFO.FREQUENCY,
		EVENTINFO.KEYWORDS,
		EVENTINFO.FROMEMAIL,
		EVENTINFO.CC,
		EVENTINFO.SUBJECT,
		EVENTINFO.MESSAGE,
		EVENTINFO.DEFAULTPRICE,
		EVENTINFO.DISCOUNTTYPE,
		EVENTINFO.PERCENTOFF,
		EVENTINFO.DISCOUNTPRICE,
		EVENTINFO.GUESTPRICE,
		EVENTINFO.REPEATAFTER,
		EVENTINFO.UNTIL,
		EVENTINFO.REPEATEND,
		EVENTINFO.EVENTCATEGORYID,
		REPEATINGEVENTINFO.EVENTINSTANCEID,
		REPEATINGEVENTINFO.ACTUALSTARTTIME,
		REPEATINGEVENTINFO.ACTUALENDTIME,
		REPEATINGEVENTINFO.REGSTARTTIME,
		REPEATINGEVENTINFO.REGENDTIME,
		REPEATINGEVENTINFO.STATUS
	FROM EVENTINFO, REPEATINGEVENTINFO
	WHERE EVENTINFO.EVENTID=REPEATINGEVENTINFO.EVENTID
</cfquery>

<cfset session.formValues.eventinstanceid=thisevent.eventinstanceid>
<cfset session.formValues.eventid=thisevent.eventid>
<cfset session.formValues.eventname=thisevent.eventname>
<cfset session.formValues.eventcategoryid=thisevent.eventcategoryid>
<cfset session.formValues.status=thisevent.status>

<cfif Trim(thisevent.actualstarttime) NEQ ''>
	<cfset starttime=Application.objtimedateconversion.stringDateToDateStruct(thisevent.actualstarttime)>
	<cfset session.formValues.startdate=starttime.date>
	<cfset session.formValues.starthour=starttime.hh>
	<cfset session.formValues.startminute=starttime.mm>
	<cfset session.formValues.startampm=starttime.ampm>
</cfif>

<cfif Trim(thisevent.actualendtime) NEQ ''>
	<cfset endtime=Application.objtimedateconversion.stringDateToDateStruct(thisevent.actualendtime)>
	<cfset session.formValues.enddate=endtime.date>
	<cfset session.formValues.endhour=endtime.hh>
	<cfset session.formValues.endminute=endtime.mm>
	<cfset session.formValues.endampm=endtime.ampm>
</cfif>

<cfset session.formValues.repeat=thisevent.frequency>
<cfif thisevent.repeatend EQ "repeat-after">
	<cfset repeatingEvent=TRUE>
	<cfinvoke component="#application.objevent#" method="getInstancecount" eventdsn="#client.siteurl#" eventid="#thisevent.eventid#" eventinstanceid="#url.eventid#" returnvariable="noofinstances">
	<cfset session.formValues.repeatafter=noofinstances>
<cfelseif thisevent.repeatend EQ "repeat-date">
	<cfset repeatingEvent=TRUE>
	<cfset session.formValues.repeatDate=Application.objtimedateconversion.convertdate(thisevent.until,'mm/dd/yyyy')>
</cfif>

<cfset session.formValues.eventurl=thisevent.eventurl>
<cfset session.formValues.description=thisevent.description>
<cfif thisevent.keywords NEQ "">
	<cfset session.formValues.fromEmail=thisevent.keywords>
<cfelse>
	<cfset session.formValues.fromEmail=thisevent.fromemail>
</cfif>
<cfset session.formValues.cc=thisevent.cc>
<cfset session.formValues.subject=thisevent.subject>
<cfset session.formValues.message=thisevent.message>
<cfset session.formValues.defaultprice=thisevent.defaultprice>
<cfset session.formValues.guestprice=thisevent.guestprice>
<cfset session.formValues.discounttype=thisevent.discounttype>
<cfset session.formValues.percentoff=thisevent.PERCENTOFF>

<cfif Trim(thisevent.regstarttime) NEQ ''>
	<cfset regstarttime=Application.objtimedateconversion.stringDateToDateStruct(thisevent.regstarttime)>
	<cfset session.formValues.regstartdate=regstarttime.date>
	<cfset session.formValues.regstarthour=regstarttime.hh>
	<cfset session.formValues.regstartminute=regstarttime.mm>
	<cfset session.formValues.regstartampm=regstarttime.ampm>
</cfif>

<cfif Trim(thisevent.regendtime) NEQ ''>
	<cfset regendtime=Application.objtimedateconversion.stringDateToDateStruct(thisevent.regendtime)>
	<cfset session.formValues.regenddate=regendtime.date>
	<cfset session.formValues.regendhour=regendtime.hh>
	<cfset session.formValues.regendminute=regendtime.mm>
	<cfset session.formValues.regendampm=regendtime.ampm>
</cfif>

<cfif Trim(thisevent.locationid) NEQ "">
	<cfset session.formValues.locationType=thisevent.locationid>
	<cfinvoke component="#application.abCFC#" method="getContactInfo" contactdsn="#client.siteurl#" nameid="#thisevent.locationid#" returnvariable="thislocation">
	<cfif thislocation.recordcount GT 0>
		<cfset session.formValues.locationname=thislocation.company>
		<cfset session.formValues.locationphone=thislocation.wphone>
		<cfset session.formValues.locationemail=thislocation.wemail>
		<cfset session.formValues.locationaddress1=thislocation.address1>
		<cfset session.formValues.locationaddress2=thislocation.address2>
		<cfset session.formValues.locationcity=thislocation.city>
		<cfset session.formValues.locationstate=thislocation.state>
		<cfset session.formValues.locationzip=thislocation.zip>
	</cfif>
</cfif>
<cfif Trim(thisevent.contactid) NEQ "">
	<cfset session.formValues.contactType=thisevent.contactid>
	<cfinvoke component="#application.abCFC#" method="getContactInfo" contactdsn="#client.siteurl#" nameid="#thisevent.contactid#" returnvariable="thiscontact">
	<cfif thiscontact.recordcount GT 0>
		<cfset session.formValues.contactfirstname=thiscontact.firstname>
		<cfset session.formValues.contactlastname=thiscontact.lastname>
		<cfset session.formValues.contactphone=thiscontact.wphone>
		<cfset session.formValues.contactemail=thiscontact.wemail>
		<cfset session.formValues.contactaddress1=thiscontact.address1>
		<cfset session.formValues.contactaddress2=thiscontact.address2>
		<cfset session.formValues.contactcity=thiscontact.city>
		<cfset session.formValues.contactstate=thiscontact.state>
		<cfset session.formValues.contactzip=thiscontact.zip>
	</cfif>
</cfif>

<cfinvoke component="#Application.objevent#" method="getGroupsInEvent" eventdsn="#client.siteurl#" eventid="#thisevent.eventid#" returnvariable="thiseventgroups">
<cfset eventgroupsli = ValueList(thiseventgroups.groupid)>