<cfparam name="form.sendnow" default="0">
<cfparam name="form.testsend" default="0">
<cfif form.sendnow NEQ "0"><cfset form.sendnow="1"></cfif>
<cfif form.testsend NEQ "0"><cfset form.testsend="1"><cfset form.sendnow="0"></cfif>

<cfset client.validation="">
<!--- start with validation of required fields --->
<cfif Trim(form.name) EQ "">
	<cfset client.validation=ListAppend(client.validation,"Name is required")>
</cfif>
<cfif Trim(form.subject) EQ "">
	<cfset client.validation=ListAppend(client.validation,"Subject is required")>
</cfif>
<cfif Trim(form.htmlnewsletter) EQ "">
	<cfset client.validation=ListAppend(client.validation,"HTML newsletter is required")>
</cfif>
<cfif Trim(form.textnewsletter) EQ "">
	<cfset client.validation=ListAppend(client.validation,"Text newsletter is required")>
</cfif>
<cfif Trim(form.replyto) EQ "">
	<cfset client.validation=ListAppend(client.validation,"A replyto email address is required")>
</cfif>

<!--- compose group list and email type list --->
<cfset grouplist="">
<cfinvoke component="#Application.abCFC#" method="searchGroup" contactdsn="#client.siteurl#" returnvariable="myGroups">

<cfloop query="myGroups">
	<cfif isDefined('form.group#groupid#')>
		<cfset grouplist=listAppend(grouplist,'#groupid#:0')>
	<cfelseif isDefined('form.eventgroup#groupid#')>
		<cfinvoke component="#application.objevent#" method="getEventsContainingGroup" eventdsn="#client.siteurl#" groupid="#groupid#" returnvariable="groupevents">
		<cfloop query="groupevents">
			<cfif isDefined('form.groupevent_#myGroups.groupid#_#eventid#')>
				<cfset grouplist=listAppend(grouplist,'#myGroups.groupid#:#eventid#')>
			</cfif>
		</cfloop>
	</cfif>
</cfloop>

<cfset excludegrouplist="">
<cfloop query="myGroups">
	<cfif isDefined('form.excludegroup#groupid#')>
		<cfset excludegrouplist=listAppend(excludegrouplist,'#groupid#:0')>
	<cfelseif isDefined('form.eventgroupexclude#groupid#')>
		<cfinvoke component="#application.objevent#" method="getEventsContainingGroup" eventdsn="#client.siteurl#" groupid="#groupid#" returnvariable="groupeventsexclude">
		<cfloop query="groupeventsexclude">
			<cfif isDefined('form.groupeventexclude_#myGroups.groupid#_#eventid#')>
				<cfset excludegrouplist=listAppend(excludegrouplist,'#myGroups.groupid#:#eventid#')>
			</cfif>
		</cfloop>
	</cfif>
</cfloop>

<cfset emailtypes="">
<cfif isDefined('form.hemail')>
	<cfset emailtypes=ListAppend(emailtypes,"hemail")>
</cfif>
<cfif isDefined('form.wemail')>
	<cfset emailtypes=ListAppend(emailtypes,"wemail")>
</cfif>
<cfif isDefined('form.memail')>
	<cfset emailtypes=ListAppend(emailtypes,"memail")>
</cfif>
<cfif isDefined('form.oemail')>
	<cfset emailtypes=ListAppend(emailtypes,"oemail")>
</cfif>
<cfif form.testsend NEQ "1">
<cfif (form.sendnow NEQ "0") OR (Trim(form.senddate) NEQ "")>
	<!--- make sure one of the email type is selected and one of the groups is selected --->
	<cfif listlen(emailtypes) EQ 0>
		<cfset client.validation=ListAppend(client.validation,"You need to select at least one email type to save or send this newsletter")>
	</cfif>
	
	<cfif listlen(grouplist) EQ 0>
		<cfset client.validation=ListAppend(client.validation,"You need to select at least one group to save or send this newsletter")>
	</cfif>
</cfif>
</cfif>


<cfif listlen(client.validation) NEQ 0>
	<cfset myNwsltrQueue=StructNew()>
	<cfset myNwsltrQueue.name=form.name>
	<cfset myNwsltrQueue.subject=form.subject>
	<cfset myNwsltrQueue.htmlnewsletter=form.htmlnewsletter>
	<cfset myNwsltrQueue.textnewsletter=form.textnewsletter>
	<cfset myNwsltrQueue.replyto=form.replyto>
	<cfset myNwsltrQueue.sendfromname=form.sendfromname>
	<cfif form.sendnow EQ "0">
		<cfset myNwsltrQueue.sendnow=0>
	<cfelse>
		<cfset myNwsltrQueue.sendnow=1>
	</cfif>
	
	<cfset myNwsltrQueue.senddate=form.senddate>
	<cfset myNwsltrQueue.queueid=0>
	<cfset myNwsltrQueue.sendhour=form.sendhour>
	<cfset myNwsltrQueue.sendmin=form.sendmin>
	<cfset myNwsltrQueue.sendampm=form.sendampm>
	<cfset myNwsltrQueue.emailtypes=emailtypes>
	<cfset myNwsltrQueue.grouplist=grouplist>
	<cfset myNwsltrQueue.excludegrouplist=excludegrouplist>
	<cfset Session.myNwsltrQueue=myNwsltrQueue>
	<cflocation url="/cms/marketing/newsletter/addnewsletter" addtoken="false">
</cfif>


<cfif form.sendnow EQ "0"> <!--- If send now was not checked --->
	<cfif Trim(form.senddate) NEQ "">
		<cfinvoke component="#application.mytime#" 
				  method="datetoint" 
				  date="#form.senddate#" 
				  hours="#form.sendhour#" 
				  minutes="#form.sendmin#" 
				  ampm="#form.sendampm#" 
				  returnvariable="strdate">
	</cfif>
<cfelse> <!--- If send now was checked --->
	<cfset strdate=Application.mytime.createTimeDate()>
</cfif>
<cftransaction>
	<!--- adds newsletter --->
	<cfinvoke component="#application.objnewsletter#" 
			  method="addnewsletter" 
			  ds="#client.siteurl#" 
			  argumentcollection="#form#" 
			  authorid="#client.masternameid#" 
			  returnvariable="newsletterid">
	
	<!--- add newsletter to queue --->
	<cfif (Trim(form.senddate) NEQ "") OR (form.sendnow EQ "1")>
	<cfinvoke component="#application.objnewsletter#" 
			  method="addNewsletterToQueue" 
			  ds="#client.siteurl#"
			  newsletterid="#newsletterid#"
			  senddate="#strdate#"
			  returnvariable="myNwsltrQueueID">
	</cfif>
	
	<!--- add newsletter to group --->
	<cfloop list="#grouplist#" index="groupandevent">
		<cfset groupid=listfirst(groupandevent,':')>
		<cfset eventid=listlast(groupandevent,':')>
		<cfinvoke component="#application.objnewsletter#"
				  method="addnewslettertousergroup"
				  ds="#client.siteurl#"
				  newsletterid="#newsletterid#"
				  usergroupid="#groupid#"
				  eventid="#eventid#">
	</cfloop>
	
	<!--- add newsletter to exlude group --->
	<cfloop list="#excludegrouplist#" index="groupandevent">
		<cfset groupid=listfirst(groupandevent,':')>
		<cfset eventid=listlast(groupandevent,':')>
		<cfinvoke component="#application.objnewsletter#"
				  method="excludeusergroup"
				  ds="#client.siteurl#"
				  newsletterid="#newsletterid#"
				  usergroupid="#groupid#"
				  eventid="#eventid#">
	</cfloop>
	
	<!--- add newsletter to email type --->
	<cfloop list="#emailtypes#" index="email">
		<cfinvoke component="#application.objnewsletter#"
				  method="addnewslettertoemailtype"
				  ds="#client.siteurl#"
				  newsletterid="#newsletterid#"
				  emailtype="#email#">
	</cfloop>
</cftransaction>
	
<cfif form.testsend EQ "1">
	<!--- send the newsletter. This part should be a separate file --->
	<cfinclude template="sendemail.cfm">
	<!--- <cfabort > --->
<cfelseif (Trim(form.senddate) NEQ "") OR (form.sendnow EQ 1)>
	<cfinvoke component="#application.objnewsletter#" method="populateTrackingTable" ds="#client.siteurl#" newsletterid="#newsletterid#">
	<cfinclude template="schedule.cfm">
</cfif>


<!--- Set a message to let user know they have saved the Newsletter successfully --->
<cfoutput>
<cfsavecontent variable="client.quicknote">
<div class="quicknote">
	<h1>The Newsletter, "#form.name#", has been saved successfully.</h1>
</div>
</cfsavecontent>
</cfoutput>