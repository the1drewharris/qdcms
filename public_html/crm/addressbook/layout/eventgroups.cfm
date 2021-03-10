<cfinvoke component="#Application.objevent#" method="getEventsWithGroupsAsssigned" eventdsn="#client.siteurl#" returnvariable="eventwithgroups">
<cfinvoke component="#Application.abCFC#" method="getGroupInfo" contactdsn="#client.siteurl#" returnvariable="allgroups">
<cfinvoke component="#Application.abCFC#" method="getContactInfo" contactdsn="#client.siteurl#" nameid="#url.id#" returnvariable="contactInfo">
<cfoutput>
	<cfif eventwithgroups.recordcount GT 0>
		<h3>Event groups associated with #contactinfo.firstname# #contactinfo.lastname#</h3>

		<cfset args.nameid=url.id>
		<form method="post" action="/cms/crm/addressbook/actioneventgroups">
		<table id="webPageEditorTable">
			<tr>
				<td class="mainWebPageInfo">
				<input type="hidden" name="nameid" value="#url.id#">
					<cfloop query="eventwithgroups">
						<h4>#eventname#</h4><br />
						<cfset args.eventid=eventid>
						<cfloop query="allgroups">
							<cfset args.usergroupid=groupid>
							<cfinvoke component="#application.objevent#" method="checkpeopleinEventGroup" eventdsn="#client.siteurl#" argumentcollection="#args#" returnvariable="isthere">
							<input type="checkbox" value="#groupid#" name="ug_#groupid#_#args.eventid#"<cfif isthere NEQ 0>Checked</cfif>>#name#<br />
						</cfloop>	
				<br /><br />
			</cfloop>
			</td>
			<td class="quickWebPageInfo">
			<input type="submit" value="Submit">
			</td>
			</tr>
			</table>
		</form>
	<cfelse>
		<div class="quicknote">
			There are no event associated with any group.
		</div>
	</cfif>
</cfoutput>