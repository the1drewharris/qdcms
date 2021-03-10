<cfparam name="url.newsletterid" default="0">
<cfif url.newsletterid NEQ 0>
	<cfinvoke component="#application.objnewsletter#" method="getSentNewsletter" ds="#client.siteurl#" newsletterid="#url.newsletterid#" returnvariable="isSent">
	<cfif isSent.recordcount GT 0>
		<cfset title="View Newsletter">
	</cfif>
</cfif>

<cfif NOT thereAreErrors>
	<cfinvoke component="#application.objnewsletter#" method="getNewsletter" ds="#client.siteurl#" newsletterid="#url.newsletterid#" returnVariable="theNewsletter">
	<cfinvoke component="#application.objnewsletter#" method="getQueue" ds="#client.siteurl#" newsletterid="#url.newsletterid#" returnVariable="myQueue">
	<cfinvoke component="#application.objnewsletter#" method="getnewslettergroups" ds="#client.siteurl#" newsletterid="#url.newsletterid#" returnVariable="newslettergroups">
	<cfinvoke component="#application.objnewsletter#" method="getnewsletterexcludegroups" ds="#client.siteurl#" newsletterid="#url.newsletterid#" returnVariable="newsletterexcludegroups">
	<cfinvoke component="#application.objnewsletter#" method="getnewsletteremailtypes" ds="#client.siteurl#" newsletterid="#url.newsletterid#" returnVariable="newsletteremailtypes">

	<cfset Session.formValues['newsletterid']=theNewsletter.newsletterid>
	<cfset Session.formValues['name']=theNewsletter.name>
	<cfset Session.formValues['subject']=theNewsletter.subject>
	<cfset Session.formValues['htmlnewsletter']=theNewsletter.htmlnewsletter>
	<cfset Session.formValues['textnewsletter']=theNewsletter.textnewsletter>
	<cfset Session.formValues['replyto']=theNewsletter.replyto>
	<cfset Session.formValues['sendfromname']=theNewsletter.sendfromname>
	<cfif myQueue.recordcount EQ 0>
		<cfset dateWhenItWasSent=application.objnewsletter.getSentDate(client.siteurl,url.newsletterid)>
		<cfif dateWhenItWasSent NEQ ''>
			<cfset Session.formValues['senddate']=application.objtimedateconversion.convertDate(dateWhenItWasSent,'mm/dd/yyyy')>
			<cfset Session.formValues['sendhour']=application.objtimedateconversion.convertTime(dateWhenItWasSent,'hh')>
			<cfset Session.formValues['sendmin']=application.objtimedateconversion.convertTime(dateWhenItWasSent,'mm')>
			<cfset Session.formValues['sendampm']=application.objtimedateconversion.convertTime(dateWhenItWasSent,'tt')>
		</cfif>
	<cfelse>
		<cfset Session.formValues['queueid']=myQueue.queueid>
		<cfset Session.formValues['senddate']=application.objtimedateconversion.convertDate(myQueue.senddate,'mm/dd/yyyy')>
		<cfset Session.formValues['sendhour']=application.objtimedateconversion.convertTime(myQueue.senddate,'hh')>
		<cfset Session.formValues['sendmin']=application.objtimedateconversion.convertTime(myQueue.senddate,'mm')>
		<cfset Session.formValues['sendampm']=application.objtimedateconversion.convertTime(myQueue.senddate,'tt')>
	</cfif>
	
	<cfloop query="newslettergroups">
		<cfif eventid NEQ ''><cfset suffix=eventid><cfelse><cfset suffix=0></cfif>
		<cfset Session.formValues['group#usergroupid#_#suffix#']="#usergroupid#:#suffix#">
	</cfloop>
	<cfloop query="newsletterexcludegroups">
		<cfif eventid NEQ ''><cfset suffix=eventid><cfelse><cfset suffix=0></cfif>
		<cfset Session.formValues['excludegroup#usergroupid#_#suffix#']="#usergroupid#:#suffix#">
	</cfloop>
	<cfloop query="newsletteremailtypes">
		<cfset Session.formValues['#emailtype#']=emailtype>
	</cfloop>
</cfif>