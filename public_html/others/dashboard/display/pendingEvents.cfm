<cfoutput>
<div id="pendingEvents">
<h3><a href="/cms/crm/events/pendingevents">Pending Events</a></h3>
<dl>
<cfloop query="pendingEvents">
	<cfinvoke component="#application.abCFC#" method="getContactInfo" contactdsn="#client.siteurl#" nameid="#CREATEDBYID#" returnvariable="submitter">
	<dt class="#eventid#">
		#eventname# -
		#application.objtimedateconversion.convertDate(actualstarttime,"mm/dd/yy")# - 
		#application.objtimedateconversion.convertDate(actualendtime,"mm/dd/yy")#
		Posted by: 
		<span class="author">
			<cfif submitter.recordcount gt 0><a href="mailto:#submitter.wemail#">#submitter.firstname# #submitter.lastname#</a><cfelse>Administrator</cfif>
		</span>
	</dt>
</cfloop>
</dl>
</div>
</cfoutput>