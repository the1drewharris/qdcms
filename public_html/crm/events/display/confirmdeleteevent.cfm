<cfoutput>
	<center>
		Are you sure you want to delete this event? <br />
		<cfif url.eventinstanceid NEQ "0">
			<a href="/cms/crm/events/deleteEvent/?eventinstanceid=#url.eventinstanceid#">Yes</a> | <a href="##" onClick="top.tb_remove();return false;">No</a>
		<cfelse>
			<a href="/cms/crm/events/deleteEvent/?eventid=#url.eventid#">Yes</a> | <a href="##" onClick="top.tb_remove();return false;">No</a>
		</cfif>
	</center>
</cfoutput>