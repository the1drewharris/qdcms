<cfinclude template="validatenewsletter.cfm"> 
<!--- returns thereAreNoErrorsInForm, conditionsMetToPutInQueue, grouplist, excludegrouplist, emailtypes --->
<cfif thereAreNoErrorsInform>
	<cfif form.sendnow EQ 0>
		<cfset strdate=application.objtimedateconversion.dateToInt(form.senddate,form.sendhour,form.sendmin,form.sendampm)>
	<cfelse>
		<cfset strdate=Application.objtimedateconversion.createTimeDate()>
	</cfif>
	
	<cfset form.ds=client.siteurl>
	<cfset form.authorid=client.masternameid>
	<cftransaction>
		<cfif url.action EQ "actionaddnewsletter">
			<cfinvoke component="#application.objnewsletter#" method="addnewsletter" argumentcollection="#form#" returnvariable="newsletterid">
		<cfelse>
			<cfset newsletterid=form.newsletterid>
			<cfinvoke component="#application.objnewsletter#" method="editnewsletter" argumentcollection="#form#">
			<cfinvoke component="#application.objnewsletter#" method="deleteNewsLettergroup" ds="#client.siteurl#" newsletterid="#newsletterid#">
			<cfinvoke component="#application.objnewsletter#" method="deletenewslettertoemailtype" ds="#client.siteurl#" newsletterid="#newsletterid#">
		</cfif>
		
		<cfif conditionsMetToPutInQueue>
			<cfinvoke component="#application.objnewsletter#" method="addNewsletterToQueue" ds="#client.siteurl#" newsletterid="#newsletterid#" senddate="#strdate#" returnvariable="myNwslterQueueId">
		</cfif>
		<cfloop list="#grouplist#" index="groupandevent" delimiters=",">
			<cfset groupid=listfirst(groupandevent,':')>
			<cfset eventid=listlast(groupandevent,':')>
			<cfinvoke component="#application.objnewsletter#" method="addnewslettertousergroup" ds="#client.siteurl#" newsletterid="#newsletterid#" usergroupid="#groupid#" eventid="#eventid#">
		</cfloop>
		<cfloop list="#excludegrouplist#" index="groupandevent" delimiters=",">
			<cfset groupid=listfirst(groupandevent,':')>
			<cfset eventid=listlast(groupandevent,':')>
			<cfinvoke component="#application.objnewsletter#" method="excludeusergroup" ds="#client.siteurl#" newsletterid="#newsletterid#" usergroupid="#groupid#" eventid="#eventid#">
		</cfloop>
		<cfloop list="#emailtypes#" index="email">
			<cfinvoke component="#application.objnewsletter#" method="addnewslettertoemailtype" ds="#client.siteurl#" newsletterid="#newsletterid#" emailtype="#email#">
		</cfloop>
		<cfif form.sendnow EQ 1>
			<cfinvoke component="#application.objnewsletter#" method="populateTrackingTable" ds="#client.siteurl#" newsletterid="#newsletterid#">
			<cfinclude template="schedule.cfm">
			<cfset client.message="The Newsletter, #form.name# is saved and sent to selected recipients">
 		<cfelseif form.testsend EQ 1>
			<cfinclude template="sendemail.cfm">
			<cfset client.message="The Newsletter, #form.name# is saved and sent to you successfully">
		<cfelseif Trim(form.senddate) NEQ ''>
			<cfinvoke component="#application.objnewsletter#" method="populateTrackingTable" ds="#client.siteurl#" newsletterid="#newsletterid#">
			<cfinclude template="schedule.cfm">
			<cfset client.message="The Newsletter, #form.name# is saved and put in queue to send later">
		<cfelse>
			<cfset client.message="The Newsletter, #form.name# is saved">
		</cfif>
	</cftransaction>
	<cfinclude template="/actions/tracking.cfm">
	<cfif form.sendnow EQ 1>
		<cfset url.fromaddress=client.username>
		<cfset url.n=newsletterid>
		<cfset url.ds=client.siteurl>
		<cfinclude template="sendnewsletter.cfm">
	</cfif>
	<cflocation url="/cms/marketing/newsletter/shownewsletters" addtoken="false">
<cfelse>
	<cflocation url="#CGI.HTTP_REFERER#" addtoken="false">
</cfif>