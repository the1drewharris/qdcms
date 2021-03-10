<cfset time = "h:mmtt">
<cfset date = "dddd, mmm dth, yyyy">
<cfinvoke component="#Application.objEvent#" method="getEventinfo" returnvariable="eventinfo" eventdsn="#client.siteurl#" eventid="#url.eventid#">
<cfoutput>
	<h3>Event Detail for #eventinfo.EventName#</h3>
	<b>Start time:</b>#Application.objtimedateconversion.convertDate(eventinfo.actualstarttime,date)# #Application.objtimedateconversion.converttime(eventinfo.actualstarttime,time)# <br />
	<b>End time:</b>#Application.objtimedateconversion.convertDate(eventinfo.actualendtime,date)# #Application.objtimedateconversion.converttime(eventinfo.actualendtime,time)# <br />
	<cfif Trim(eventinfo.description) NEQ ''>
	#eventinfo.description#
	</cfif>
	<cfif Trim(eventinfo.contactfirstname) NEQ ''>
		<div class="heading">Contact</div>
		#eventinfo.contactfirstname# #eventinfo.contactlastname# <br />
	</cfif>
	<cfif Trim(eventinfo.contactaddress1) NEQ ''>
		#eventinfo.contactaddress1# #eventinfo.contactaddress2# <br />
	</cfif>
	<cfif Trim(eventinfo.locationname NEQ '')>
		<div class="heading">Location</div>
		<cfif Trim(eventinfo.locationaddress1) NEQ ''>
			#eventinfo.locationaddress1# #eventinfo.locationaddress2# <br />
			#eventinfo.locationcity# #eventinfo.locationstate# #eventinfo.locationzip#
		</cfif>
	</cfif>
</cfoutput>
