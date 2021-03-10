<cfparam name="form.allday" default="0">
<cfinclude template="validateeventform.cfm">
<cfoutput>
	<cfif thereAreNoErrorsInForm>
		<cfset argsEvent=structNew()>
		<cfset argsEvent.eventname=form.eventname>
		<cfset argsEvent.eventcategoryid=form.eventcategoryid>
		<cfset argsEvent.status=form.status>
		<cfif form.allday EQ 1>
			<cfset argsEvent.starttime=application.objtimedateconversion.dateToInt(form.alldaydate,'12','00','AM')>
			<cfset argsEvent.endtime=application.objtimedateconversion.dateToInt(form.alldaydate,'11','59','PM')>
		<cfelse>
			<cfset argsEvent.starttime=application.objtimedateconversion.dateToInt(form.startdate,form.starthour,form.startminute,form.startampm)>
			<cfset argsEvent.endtime=application.objtimedateconversion.dateToInt(form.enddate,form.endhour,form.endminute,form.endampm)>
		</cfif>
		<cfset argsEvent.repeat=form.repeat>
		
		<cfif form.repeat NEQ "None">
			<cfset argsEvent.repeatAfter=form.repeatAfter>
			<cfif Trim(form.repeatAfter) NEQ "">
				<cfset argsEvent.repeatend="repeat-after">
				<cfset argsEvent.repeatdate=0>
			<cfelse>
				<cfset argsEvent.repeatend="repeat-date">
				<cfset argsEvent.repeatdate = application.objtimedateconversion.dateToInt(form.repeatdate,"11","59","PM")>
				<cfset argsEvent.repeatAfter=0>
			</cfif>
		<cfelse>
			<cfset argsEvent.repeatend="repeat-after">
			<cfset argsEvent.repeatAfter=1>
			<cfset argsEvent.repeatdate=0>
		</cfif>
		
		<cfset argsEvent.eventurl=form.eventurl>
		<cfset argsEvent.description=form.description>
		<cfset argsEvent.fromEmail=form.fromEmail>
		<cfset argsEvent.cc=form.cc>
		<cfset argsEvent.subject=form.subject>
		<cfset argsEvent.message=form.message>
		<cfset argsEvent.defaultprice=form.defaultprice>
		<cfset argsEvent.guestprice=form.guestprice>
		<cfset argsEvent.discountType=form.discountType>
		<cfif form.discountType EQ "Percentage">
			<cfset argsEvent.percentoff=form.percentoff>
		</cfif>
		
		<cfset argsEvent.regstartdate=form.regstartdate>
		<cfset argsEvent.regenddate=form.regenddate>
		
		<cfif Trim(form.regstartdate) EQ "">
			<cfset argsEvent.regstarttime=argsEvent.starttime>
			<cfset argsEvent.regendtime=argsEvent.endtime>
		<cfelse>
			<cfset argsEvent.regstarttime=application.objtimedateconversion.dateToInt(form.regstartdate,form.regstarthour,form.regstartminute,form.regstartampm)>
			<cfset argsEvent.regendtime=application.objtimedateconversion.dateToInt(form.regenddate,form.regendhour,regendminute,form.regendampm)>
		</cfif>
		
		<cfif newContact OR updateContact>
			<cfset argsContact=structNew()>
			<cfset argsContact.contactdsn=client.siteurl>
			<cfset argsContact.firstname=form.contactfirstname>
			<cfset argsContact.lastname=form.contactlastname>
			<cfset argsContact.wphone=form.contactphone>
			<cfset argsContact.wemail=form.contactemail>
			<cfset argsContact.address1=form.contactaddress1>
			<cfset argsContact.address2=form.contactaddress2>
			<cfset argsContact.city=form.contactcity>
			<cfset argsContact.state=form.contactstate>
			<cfset argsContact.zip=form.contactzip>
			<cfif updateContact>
				<cfset argsContact.mynameid=contactid>
			</cfif>
		</cfif>
		
		<cfif newLocation OR updateLocation>
			<cfset argsLocation=StructNew()>
			<cfset argsLocation.contactdsn=client.siteurl>
			<cfset argsLocation.firstname="">
			<cfset argsLocation.lastname="">
			<cfset argsLocation.company=form.locationname>
			<cfset argsLocation.wphone=form.locationphone>
			<cfset argsLocation.wemail=form.locationemail>
			<cfset argsLocation.address1=form.locationaddress1>
			<cfset argsLocation.address2=form.locationaddress2>
			<cfset argsLocation.city=form.locationcity>
			<cfset argsLocation.state=form.locationstate>
			<cfset argsLocation.zip=form.locationzip>
			<cfif updateLocation>
				<cfset argsLocation.mynameid=locationid>
			</cfif>
		</cfif>		
		
		<cfswitch expression="#url.action#">
			<cfcase value="actionaddevent">				
				<cftransaction>
					<cfinvoke component="#Application.objEvent#" method="addevent" argumentcollection="#argsEvent#" eventdsn="#client.siteurl#" returnvariable="eventid">
					<cfif newContact>
						<cfinvoke component="#Application.abCFC#" method="addContact" argumentcollection="#argsContact#" returnvariable="contactid">
						<cfinvoke component="#application.objevent#" method="getEventContactGroup" eventdsn="#client.siteurl#" returnvariable="eventcontactgroupid">	
						<cfinvoke component="#Application.abCFC#" method="addContactToGroup" contactdsn="#client.siteurl#" nameid="#contactid#" groupid="#eventcontactgroupid#">
					</cfif>
					<cfif newLocation>
						<cfinvoke component="#Application.abCFC#" method="addContact" argumentcollection="#argsLocation#" returnvariable="locationid">
						<cfinvoke component="#Application.objEvent#" method="getEventLocationGroup" eventdsn="#client.siteurl#" returnvariable="eventlocationgroupid">	
						<cfinvoke component="#Application.abCFC#" method="addContactToGroup" contactdsn="#client.siteurl#" nameid="#locationid#" groupid="#eventlocationgroupid#">
					</cfif>
					<cfif locationid NEQ 0>
						<cfinvoke component="#Application.objEvent#" method="addLocationToEvent" eventdsn="#client.siteurl#" contactid="#locationid#" eventid="#eventid#">
					</cfif>
					<cfif contactid NEQ 0>
						<cfinvoke component="#Application.objEvent#" method="addContactToEvent" eventdsn="#client.siteurl#" contactid="#contactid#" eventid="#eventid#">
					</cfif>
					<cfif isDefined('form.groupid')>
						<cfinvoke component="#Application.objEvent#" method="addGroupsToEvent" eventdsn="#client.siteurl#" eventid="#eventid#" groups="#form.groupid#">
					</cfif>
					<cfif updateContact>
						<cfinvoke component="#application.abCFC#" method="updateContact" argumentcollection="#argsContact#">
					</cfif>
					<cfif updateLocation>
						<cfinvoke component="#application.abCFC#" method="updateContact" argumentcollection="#argsLocation#">
					</cfif>
				</cftransaction>	
				<cfinclude template="/actions/tracking.cfm">
			</cfcase>
			<cfcase value="actioneditevent">
				<cfset itIsaRepeatingEvent=application.objevent.isItaRepeatingEvent(client.siteurl,form.instanceid)>
				<cfinvoke component="#application.objEvent#" method="getRepeatingEventInfo" eventdsn="#client.siteurl#" eventinstanceid="#form.instanceid#" returnvariable="repeatingEventInfo">
				
				<cftransaction>
					<cfif itIsaRepeatingEvent>	
						<cfinvoke component="#application.objEvent#" method="deleteRecurringEvent" eventdsn="#client.siteurl#" eventid="#repeatingEventInfo.eventid#" startingdate="#repeatingEventInfo.actualstarttime#">
						<cfinvoke component="#Application.objEvent#" method="getInstancesOfEvent" eventdsn="#client.siteurl#" eventid="#repeatingEventInfo.eventid#" noofeventstoreturn="1" returnvariable="instancesOfEvent">
						<cfif instancesOfEvent.recordcount GT 0> <!--- some of the repeating event has already occured --->
							<cfset argsThisEvent=StructNew()>
							<cfset argsThisEvent.eventdsn=client.siteurl>
							<cfset argsThisEvent.eventid=repeatingEventInfo.eventid>
							<cfset argsThisEvent.eventcategoryid=form.eventcategoryid>
							<cfset argsThisEvent.eventname=instancesOfEvent.eventname>
							<cfset argsThisEvent.repeatend="repeat-date">
							<cfset argsThisEvent.repeatdate=instancesOfEvent.actualstarttime>
							<cfinvoke component="#Application.objEvent#" method="updateEvent" argumentcollection="#argsThisEvent#">
						<cfelse>	
							<cfinvoke component="#Application.objEvent#" method="deleterecurringevent" eventdsn="#client.siteurl#" eventid="#repeatingEventInfo.eventid#">
							<cfinvoke component="#Application.objEvent#" method="deleteEvent" eventdsn="#client.siteurl#" eventid="#repeatingEventInfo.eventid#"> <!--- Set Status to Deleted in event table, delete others--->
						</cfif>
						<!--- A new event is created from here --->
						<cfinvoke component="#Application.objEvent#" method="addevent" argumentcollection="#argsEvent#" eventdsn="#client.siteurl#" returnvariable="eventid">
						<cfinvoke component="#application.objhau#" method="updatehau2Event" haudsn="#client.siteurl#" oldeventid="#repeatingEventInfo.eventid#" neweventid="#eventid#">
						<cfinvoke component="#application.objhau#" method="updatehau2people" haudsn="#client.siteurl#" oldeventid="#repeatingEventInfo.eventid#" neweventid="#eventid#">
						<cfinvoke component="#application.objEvent#" method="updatepeople2event" eventdsn="#client.siteurl#" oldeventid="#repeatingEventInfo.eventid#" neweventid="#eventid#">
					<cfelse>
						<cfinvoke component="#application.objEvent#" method="deleteOneRecurringEvent" eventdsn="#client.siteurl#" eventinstanceid="#form.instanceid#">
						<cfset argsEvent.eventid=repeatingEventInfo.eventid>
						<cfset argsEvent.eventdsn=client.siteurl>
						<cfset eventid=repeatingEventInfo.eventid>
						<cfinvoke component="#application.objEvent#" method="updateEvent" argumentcollection="#argsEvent#">
						<cfset argsRepeatingEvent=structNew()>
						<cfset argsRepeatingEvent.eventdsn=client.siteurl>
						<cfset argsRepeatingEvent.eventid=repeatingeventinfo.eventid>
						<cfset argsRepeatingEvent.start=argsEvent.starttime>
						<cfset argsRepeatingEvent.endtime=argsEvent.endtime>
						<cfset argsRepeatingEvent.frequency=argsEvent.repeat>
						<cfset argsRepeatingEvent.registrationstart=argsEvent.regstarttime>
						<cfset argsRepeatingEvent.registrationend=argsEvent.regendtime>
						<cfset argsRepeatingEvent.status=argsEvent.status>
						<cfset argsRepeatingEvent.repeatend=argsEvent.repeatend>
						<cfset argsRepeatingEvent.end=argsEvent.repeatDate>
						<cfset argsRepeatingEvent.nooftimes=argsEvent.repeatAfter>
						<cfinvoke component="#application.objEvent#" method="recordRepeatingEvent" argumentcollection="#argsRepeatingEvent#">
					</cfif>
					
					<cfif newContact>
						<cfinvoke component="#Application.abCFC#" method="addContact" argumentcollection="#argsContact#" returnvariable="contactid">
						<cfinvoke component="#Application.objEvent#" method="getEventContactGroup" eventdsn="#client.siteurl#" returnvariable="eventcontactgroupid">	
						<cfinvoke component="#Application.abCFC#" method="addContactToGroup" contactdsn="#client.siteurl#" nameid="#contactid#" groupid="#eventcontactgroupid#">
					</cfif>
					<cfif newLocation>
						<cfinvoke component="#Application.abCFC#" method="addContact" argumentcollection="#argsLocation#" returnvariable="locationid">
						<cfinvoke component="#Application.objEvent#" method="getEventLocationGroup" eventdsn="#client.siteurl#" returnvariable="eventlocationgroupid">	
						<cfinvoke component="#Application.abCFC#" method="addContactToGroup" contactdsn="#client.siteurl#" nameid="#locationid#" groupid="#eventlocationgroupid#">
					</cfif>
	
					<cfinvoke component="#Application.objEvent#" method="addLocationToEvent" eventdsn="#client.siteurl#" contactid="#locationid#" eventid="#eventid#">
					<cfinvoke component="#Application.objEvent#" method="addContactToEvent" eventdsn="#client.siteurl#" contactid="#contactid#" eventid="#eventid#">
					<cfif isDefined('form.groupid')>
						<cfinvoke component="#Application.objEvent#" method="addGroupsToEvent" eventdsn="#client.siteurl#" eventid="#eventid#" groups="#form.groupid#">
					<cfelse>
						<cfinvoke component="#Application.objEvent#" method="deletegroupsforevent" eventdsn="#client.siteurl#" eventid="#eventid#">
					</cfif>
					
					<cfif updateContact>
						<cfinvoke component="#application.abCFC#" method="updateContact" argumentcollection="#argsContact#">
					</cfif>
					<cfif updateLocation>
						<cfinvoke component="#application.abCFC#" method="updateContact" argumentcollection="#argsLocation#">
					</cfif>
				</cftransaction>	
				<cfinclude template="/actions/tracking.cfm">
			</cfcase>
		</cfswitch>
	<cfelse>
		<cflocation url="#cgi.http_referer#" addtoken="false">
	</cfif>	
</cfoutput>
<cflocation url="/cms/crm/events" addtoken="false">