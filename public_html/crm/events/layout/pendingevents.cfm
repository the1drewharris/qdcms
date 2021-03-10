<cfinvoke component="#Application.objEvent#" method="getEvents" eventdsn="#client.siteurl#" status="pending" returnvariable="events">
<cfif events.recordcount gt 0>
	<table class="datagrid" border="1" width="910">
		<tr class="titlebar">
			<th>Submitter</th>
			<th>Event Name</th>
			<th>Event Status</th>
			<th>Approve</th>
			<th>Delete</th>
		</tr>
		<tbody>
		<form id="form" action="/cms/crm/events/actionpendingevents" method="post">
			<cfoutput query="events">
				<cfinvoke component="addressbook" method="getContactInfo" contactdsn="#client.siteurl#" nameid="#CREATEDBYID#" returnvariable="submitter">
				<cfif currentRow MOD 2 EQ 0><tr><cfelse><tr class="alt"></cfif>
					<cfif submitter.recordcount gt 0>
						<td><a href="mailto:#submitter.wemail#">#submitter.firstname# #submitter.lastname#</a></td>
					<cfelse>
						<td>Administrator</td>
					</cfif>
					<td><a href="javascript:showeventdetail('#eventid#')">#eventname#</a></td>
					<td>#status#</td>
					<td><input type="checkbox" unchecked name="approve" value="#eventid#"></td>
					<td><input type="checkbox" unchecked name="delete" value="#eventid#"></td>
				</tr>
			</cfoutput>
			<tr><td colspan="5" align="right">
			<input type="submit" name ="submit" value="submit">
			</td></tr>	
		</form>
		</tbody>
	</table>
<cfelse>
	No Pending Events
</cfif>
<br /><br />
<div id="pending-event-detail">

</div>