<cfset args=StructNew()>
<cfset argsToDisplay="">
<cfif Trim(form.firstname) NEQ "">
	<cfset args.firstname=Trim(form.firstname)>
	<cfset argsToDisplay=ListAppend(argsToDisplay, 'First Name: #args.firstname#')>
</cfif>
<cfif Trim(form.lastname) NEQ "">
	<cfset args.lastname=Trim(form.lastname)>
	<cfset argsToDisplay=ListAppend(argsToDisplay, 'Last Name: #args.lastname#')>
</cfif>
<cfif Trim(form.middlename) NEQ "">
	<cfset args.middlename=Trim(form.middlename)>
	<cfset argsToDisplay=ListAppend(argsToDisplay, 'Middle Name: #args.middlename#')>
</cfif>
<cfif Trim(form.company) NEQ "">
	<cfset args.company=Trim(form.company)>
	<cfset argsToDisplay=ListAppend(argsToDisplay, 'Company: #args.company#')>
</cfif>
<cfif Trim(form.title) NEQ "">
	<cfset args.title=Trim(form.title)>
	<cfset argsToDisplay=ListAppend(argsToDisplay, 'Title: #args.title#')>
</cfif>
<cfif Trim(form.phone) NEQ "">
	<cfset args.areacode=Trim(form.phone)>
	<cfset argsToDisplay=ListAppend(argsToDisplay, 'Phone: #args.areacode#')>
</cfif>
<cfif Trim(form.email) NEQ "">
	<cfset args.email=Trim(form.email)>
	<cfset argsToDisplay=ListAppend(argsToDisplay, 'Email: #args.email#')>
</cfif>
<cfif Trim(form.clientuserid) NEQ "">
	<cfset args.clientuserid=Trim(form.clientuserid)>
	<cfset argsToDisplay=ListAppend(argsToDisplay, 'Clientuserid: #args.clientuserid#')>
</cfif>
<cfif Trim(form.address1) NEQ "">
	<cfset args.address1=Trim(form.address1)>
	<cfset argsToDisplay=ListAppend(argsToDisplay, 'Address1: #args.address1#')>
</cfif>
<cfif Trim(form.address2) NEQ "">
	<cfset args.address2=Trim(form.address2)>
	<cfset argsToDisplay=ListAppend(argsToDisplay, 'Address2: #args.address2#')>
</cfif>
<cfif Trim(form.city) NEQ "">
	<cfset args.city=Trim(form.city)>
	<cfset argsToDisplay=ListAppend(argsToDisplay, 'City: #args.city#')>
</cfif>
<cfif Trim(form.state) NEQ "">
	<cfset args.state=Trim(form.state)>
	<cfset argsToDisplay=ListAppend(argsToDisplay, 'State: #args.state#')>
</cfif>
<cfif Trim(form.zip) NEQ "">
	<cfset args.zip=Trim(form.zip)>
	<cfset argsToDisplay=ListAppend(argsToDisplay, 'Zip: #args.zip#')>
</cfif>
<cfif Trim(form.eventid) NEQ 0>
	<cfset args.eventid=Trim(form.eventid)>
	<cfset thiseventname=application.objevent.getEventName(client.siteurl,args.eventid)>
	<cfset argsToDisplay=ListAppend(argsToDisplay, 'Event: #thiseventname#')>
</cfif>
<cfif Trim(form.startdate) NEQ "">
	<cfset args.registrationStartDate=application.objtimedateconversion.datetoInt(form.startdate)>
	<cfset argsToDisplay=ListAppend(argsToDisplay, 'Start Date: #application.objtimedateconversion.convertdate(args.registrationStartDate,"mmm dd, yyyy")#')>
</cfif>
<cfif Trim(form.enddate) NEQ "">
	<cfset args.registrationEndDate=application.objtimedateconversion.datetoInt(form.enddate,"11","59","PM")>
	<cfset argsToDisplay=ListAppend(argsToDisplay, 'End Date: #application.objtimedateconversion.convertdate(args.registrationEndDate,"mmm dd, yyyy")#')>
</cfif>
<cfif Trim(form.facebook) NEQ "">
	<cfset args.facebook=Trim(form.facebook)>
	<cfset argsToDisplay=ListAppend(argsToDisplay, 'Facebook: #args.facebook#')>
</cfif>
<cfif Trim(form.twitter) NEQ "">
	<cfset args.twitter=Trim(form.twitter)>
	<cfset argsToDisplay=ListAppend(argsToDisplay, 'Twitter: #args.twitter#')>
</cfif>
<cfif Trim(form.linkedin) NEQ "">
	<cfset args.linkedin=Trim(form.linkedin)>
	<cfset argsToDisplay=ListAppend(argsToDisplay, 'LinkedIn: #args.linkedin#')>
</cfif>
<cfif Trim(form.myspace) NEQ "">
	<cfset args.myspace=Trim(form.myspace)>
	<cfset argsToDisplay=ListAppend(argsToDisplay, 'MySpace: #args.myspace#')>
</cfif>
<cfif Trim(form.youtube) NEQ "">
	<cfset args.youtube=Trim(form.youtube)>
	<cfset argsToDisplay=ListAppend(argsToDisplay, 'YouTube: #args.youtube#')>
</cfif>
<cfif Trim(form.plaxo) NEQ "">
	<cfset args.plaxo=Trim(form.plaxo)>
	<cfset argsToDisplay=ListAppend(argsToDisplay, 'Plaxo: #args.plaxo#')>
</cfif>
<cfif Trim(form.friendfeed) NEQ "">
	<cfset args.friendfeed=Trim(form.friendfeed)>
	<cfset argsToDisplay=ListAppend(argsToDisplay, 'Friend Feed: #args.friendfeed#')>
</cfif>
<cfif isDefined('form.grouplist')>
	<cfset args.grouplist=form.grouplist>
	<cfset selectedGroups="">
	<cfloop list="#args.grouplist#" index="gid">
		<cfset thisgroup=application.abCFC.getGroupNameOnly(client.siteurl,gid)>
		<cfset selectedgroups=listAppend(selectedgroups,thisgroup,";")>
	</cfloop>
	<cfset argsToDisplay=ListAppend(argsToDisplay, 'Groups: #selectedgroups#')>
</cfif>

<cfset Session.searchArguments=args>