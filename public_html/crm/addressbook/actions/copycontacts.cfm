<cftransaction>
	<cfloop list="#form.groups#" index="groupid">
		<cfloop list="#form.ids#" index="nameid">
			<cfinvoke component="#application.abCFC#" method="addContactToGroup" contactdsn="#client.siteurl#" groupid="#groupid#" nameid="#nameid#">
		</cfloop>
	</cfloop>
</cftransaction>
<cfinclude template="/actions/tracking.cfm">
<cfoutput>#listLen(form.ids)# contacts copied</cfoutput>