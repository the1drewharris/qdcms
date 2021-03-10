<cfset databasesToSync=listPrepend(databasesToSync,client.siteurl)>
<cfset newids=application.abCFC.getMaxIdsFromSyncedAB(databasesToSync)>
<cfset form.nameid=newids.maxnameid+1>
<cfif Trim(form.clientuserid) EQ ''>
	<cfset form.clientuserid=newids.maxclientuserid+1>
</cfif>
<cfif Trim(form.address1) NEQ "" AND Trim(form.city) NEQ "" AND Trim(form.state) NEQ "" AND Trim(form.zip) NEQ "">
	<cfinvoke component="#application.objlatlon#" method="get" address="#form.address1#" city="#form.city#" state="#form.state#" zip="#form.zip#" returnvariable="latlon">
	<cfset form.lat=latlon.lat>
	<cfset form.lon=latlon.lon>
</cfif>
<cfloop list="#databasesToSync#" index="databasename">
	<cftransaction>
		<cfinvoke component="#application.abCFC#" method="addContactWithNameID" contactdsn="#databasename#" argumentcollection="#form#">
	</cftransaction>
</cfloop>
<cfloop list="#form.grouplist#" index="groupid">
	<cfinvoke component="#application.abCFC#" method="addContactToGroup" contactdsn="#client.siteurl#" nameid="#form.nameid#" groupid="#groupid#">
</cfloop>
<cfif Trim(form.filedata) NEQ ''>
	<cfinclude template="uploadprofilepic.cfm">
</cfif>	