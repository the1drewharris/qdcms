<!--- Syncs the contacts to other databases --->
<cfset databasesToSync=Application.objsite.getDatabasesToSync(client.siteid)>
<cfif listlen(databasesToSync) GT 0>
	<cfloop list="#databasesToSync#" index="databasename">
		<cfset form.contactdsn=databasename>
		<cfinvoke component="#application.abCFC#" method="updateContact" argumentcollection="#form#">
	</cfloop>
</cfif>