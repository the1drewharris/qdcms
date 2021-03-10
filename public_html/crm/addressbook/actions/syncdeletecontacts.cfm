<cfset databasesToSync=Application.objsite.getDatabasesToSync(client.siteid)>
<cfif listlen(databasesToSync) GT 0>
	<cfloop list="#databasesToSync#" index="databasename">
		<cfinvoke component="#application.abCFC#" method="deletecontacts" contactdsn="#databasename#" contactlist="#url.contactlist#">
	</cfloop>
</cfif>