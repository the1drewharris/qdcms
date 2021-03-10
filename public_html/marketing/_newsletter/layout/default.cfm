
<!--- <cfif isDefined('form.keyword')>	
<cfelse>

</cfif>
<cfif newsletters.recordcount GT 0>
	<table class="datagrid" width="910">
		<tr class="titlebar"><th>Name</th><th>Subject</th><th>Created on</th><th>Last Updated</th><th>Template</th></tr>
		<cfoutput query="newsletters">
			<tr>
				<td>
					<a href="/index.cfm?section=content&module=newsletter&action=editnewsletter&newsletterid=#newsletterid#">#name#</a>
					(<a href="/index.cfm?section=content&module=newsletter&action=queue">Enqueue</a>)
				</td>
				<td>#Subject#</td>
				<cfset createddate=convertDate(createdon,"mm/dd/yyyy")>
				<cfset createdtime=convertTime(createdon,"hh")>
				<cfset createdtime=createdtime & ":" & convertTime(createdon,"mm")>
				<cfset ampm=convertTime(createdon,"tt")>
				<cfif ampm eq "pm">
					<cfset createdtime=createdtime & " " & "PM">
				<cfelse>
					<cfset createdtime=createdtime & " " & "AM">
				</cfif>
				<td>#createddate# #createdtime#</td>
				
				<cfset updateddate=convertDate(updatedon,"mm/dd/yyyy")>
				<cfset updatedtime=convertTime(updatedon,"hh")>
				<cfset updatedtime=updatedtime & ":" & convertTime(updatedon,"mm")>
				<cfset ampm=convertTime(updatedon,"tt")>
				<cfif ampm eq "pm">
					<cfset updatedtime=updatedtime & " " & "PM">
				<cfelse>
					<cfset updatedtime=updatedtime & " " & "AM">
				</cfif>
			
				<td>#updateddate# #updatedtime#</td>
				
				<td>#newslettertemplatename#</td>
			</tr>
		</cfoutput>
	</table>
<cfelse>
	It's time to add a Newsletter.
</cfif> --->

<cfset request.objNewsletter = createObject("component","newsletter")>

<link rel="stylesheet" href="/css/forms.css" type="text/css" media="screen" />
<link rel="stylesheet" href="/css/calendar.css" media="screen" />
<!--- <link rel="stylesheet" href="forms.css" type="text/css" media="screen" /> --->
<script type="text/javascript" src="/js/mootools.v1.2.js"></script>
<script type="text/javascript" src="/js/fValidator.js"></script>
<script type="text/javascript" src="/js/calendar.js"></script>

<cfparam name="url.newsletterid" default="0">
<cfparam  name="client.validation" default="">
<cfswitch expression="#url.action#">
	<!--- View Newsletter --->
	<cfcase value="viewNewsletter">
		<cfinvoke component="#application.objnewsletter#" method="getNewsletter" ds="#client.siteurl#" returnVariable="getMyNewsletter">
		<cfinclude template="../display/frmViewNewsletter.cfm">		
	</cfcase>
			
	<!--- Add Newsletter --->
	<cfcase value="addNewsletter">
		<cfset formaction = "/cms/marketing/newsletter/actionaddNewsletter">
		<cfset formtitle = "News Letter">
		
		<cfif listlen(client.validation) EQ 0>
			<cfset myNewsLetter.sendnow = "">
			<cfset myNewsLetter.name = "">
			<cfset myNewsLetter.subject = "">
			<cfset myNewsLetter.textnewsletter = "">
			<cfset myNewsLetter.htmlnewsletter = "">
			<cfset myNewsLetter.queueid = 0>
			<cfset myNewsLetter.grouplist = "">
			<cfset myNewsLetter.excludegrouplist = "">
			<cfset myNewsLetter.emailtypes = "">
			<cfset myNewsLetter.senddate = "">
			<cfset myNewsLetter.sendhour = "">
			<cfset myNewsLetter.sendmin = "">
			<cfset myNewsLetter.sendampm = "">
			<cfset myNewsLetter.sendnow = 0>
			<cfset myNewsLetter.replyto=client.commentemail>
			<cfset myNewsLetter.sendfromname='#client.firstname# #client.lastname#'>
		<cfelse>
			<cfset myNewsLetter=Session.myNwsltrQueue>
		</cfif>
		
		<cfinclude template="../display/frmAddEditNwsLtr.cfm">	
	</cfcase>
	
	<cfcase value="template">
		<cfinclude template="/marketing/newsletter/display/addedittemplate.cfm">
	</cfcase>
	<cfcase value="search">
		<cfinclude template="/marketing/newsletter/display/searchnewsletter.cfm">
	</cfcase>
	<cfcase value="queue">
		<cfinclude template="/marketing/newsletter/display/queuenewsletter.cfm">
	</cfcase>
	<!--- Edit Newsletter --->
	<cfcase value="editnewsletter">
		<cfif listlen(client.validation) EQ 0>
			<cfinvoke component="#application.objnewsletter#" method="getNewsletter" ds="#client.siteurl#" newsletterid="#url.newsletterid#" returnVariable="theNewsletter">
			<cfif theNewsletter.recordCount GT 0>
				<cfset myNewsLetter=StructNew()>
				<cfset myNewsLetter.newsletterid=url.newsletterid>
				<cfset myNewsLetter.name=theNewsletter.name>
				<cfset myNewsLetter.subject=theNewsletter.subject>
				<cfset myNewsLetter.htmlnewsletter=theNewsletter.htmlnewsletter>
				<cfset myNewsLetter.textnewsletter=theNewsletter.textnewsletter>
				<cfset myNewsLetter.replyto=theNewsletter.replyto>
				<cfset myNewsLetter.sendfromname=theNewsletter.sendfromname>
				
				<cfinvoke component="#application.objnewsletter#" method="getQueue" ds="#client.siteurl#" newsletterid="#url.newsletterid#" returnVariable="myQueue">
				<cfset myNewsLetter.queueid=myQueue.queueid>
				
				<cfset myNewsLetter.sendnow=0>
				<cfif myQueue.recordcount EQ 0>
					<cfset myNewsLetter.senddate="">
					<cfset myNewsLetter.sendhour="">
					<cfset myNewsLetter.sendmin="">
					<cfset myNewsLetter.sendampm="">
				<cfelse>
					<cfset myNewsLetter.senddate=application.mytime.convertDate(myQueue.senddate,"mm/dd/yyyy")>
					<cfset myNewsLetter.sendhour=application.mytime.convertTime(myQueue.senddate,"hh")>
					<cfset myNewsLetter.sendmin=application.mytime.convertTime(myQueue.senddate,"mm")>
					<cfset myNewsLetter.sendampm=application.mytime.convertTime(myQueue.senddate,"tt")>
				</cfif>
				
				<!--- prepare information --->
				<cfset grouplist = "">
				<cfinvoke component="#application.objnewsletter#" method="getnewslettergroups" ds="#client.siteurl#" newsletterid="#url.newsletterid#" returnVariable="newslettergroups">
				<cfloop query="newslettergroups">
					<cfif eventid NEQ ''>
						<cfset groupandevent="#usergroupid#:#eventid#">
					<cfelse>
						<cfset groupandevent="#usergroupid#:0">
					</cfif>
					<cfset grouplist=listAppend(grouplist,groupandevent)>
				</cfloop>
				<cfset myNewsLetter.grouplist=grouplist>
				
				<cfset excludegrouplist = "">
				<cfinvoke component="#application.objnewsletter#" method="getnewsletterexcludegroups" ds="#client.siteurl#" newsletterid="#url.newsletterid#" returnVariable="newslettergroups">
				<cfloop query="newslettergroups">
					<cfif eventid NEQ ''>
						<cfset groupandevent="#usergroupid#:#eventid#">
					<cfelse>
						<cfset groupandevent="#usergroupid#:0">
					</cfif>
					<cfset excludegrouplist=listAppend(excludegrouplist, groupandevent)>
				</cfloop>
				<cfset myNewsLetter.excludegrouplist=excludegrouplist>
				
				<cfset emailtypes = "">
				<cfinvoke component="#application.objnewsletter#" method="getnewsletteremailtypes" ds="#client.siteurl#" newsletterid="#url.newsletterid#" returnVariable="newsletteremailtypes">
				<cfloop query="newsletteremailtypes">
					<cfset emailtypes=listAppend(emailtypes, emailtype)>
				</cfloop>
				<cfset myNewsLetter.emailtypes=emailtypes>
			<cfelse>
				<div class="quicknote">
					<h1>Unable to locate the Newsletter you have requested.</h1>
					<p><a href="/cms/marketing/newsletter">Go here</a> and choose a newsletter, 
					We are sorry for the inconvenience.</p>
				</div>
				<cfabort>
			</cfif>
		<cfelse>
			<cfset myNewsLetter=Session.myNwsltrQueue>
		</cfif>
		<cfset formaction = "/cms/marketing/newsletter/actioneditNewsletter">
		<cfinclude template="../display/frmAddEditNwsLtr.cfm">
	</cfcase>

	<cfcase value="addtemplate">
		<cfset formaction="addtemplate">
		<cfset qdcmsTitle="Add Newsletter Template">
		<cfinclude template="/marketing/newsletter/display/addedittemplate.cfm">
	</cfcase>

	<cfcase value="edittemplate">
		<cfset formaction="edittemplate">
		<cfset qdcmsTitle="Edit Newsletter Template">
		<cfinclude template="/marketing/newsletter/display/addedittemplate.cfm">
	</cfcase>
	
	<cfcase value="managetemplate">
		<cfinclude template="/marketing/newsletter/display/manageTemplates.cfm">
	</cfcase>
			
	<cfdefaultcase>
		<cfset client.validation="">
		<cfset args=structNew()>
		<cfset args.ds=client.siteurl>
		<cfif isDefined('form.keyword')>
			<cfset args.keyword=form.keyword>
		</cfif>
		<cfinvoke component="#application.objnewsletter#" method="getNewsletter" argumentcollection="#args#" returnVariable="getMyNewsletter"  >
		<cfinclude template="../display/frmViewNewsletter.cfm">		
	</cfdefaultcase>
	
</cfswitch>