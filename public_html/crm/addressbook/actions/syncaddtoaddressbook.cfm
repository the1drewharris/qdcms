<cfset databasesToSync=listPrepend(databasesToSync,client.siteurl)>
<cfloop from="1" to="#noofrows#" index="row">
	<cfset newids=application.abCFC.getMaxIdsFromSyncedAB(databasesToSync)>
	<cfset args=StructNew()>
	<cfset args['nameid']=newids.maxnameid+1>
	
	<cfset args.address1=''>
	<cfset args.city=''>
	<cfset args.state=''>
	<cfset args.zip=''>
	
	<cfloop from="1" to="#noofcols#" index="i">
		<cfset column=columndb[listGetAt(form.dbc,i)]>
		<cfset args['#column#']=data[row][listGetAt(form.xlc,i)]>
	</cfloop>
	<cfif NOT isDefined('args.clientuserid')>
		<cfset args.clientuserid=newids.maxclientuserid+1>
	</cfif>
	
	<cfif Trim(args.address1) NEQ ''>
		<cfif Trim(args.city) NEQ ''>
			<cfif Trim(args.state) NEQ ''>
				<cfif Trim(args.zip) NEQ ''>
					<cfinvoke component="#application.objlatlon#" method="get" address="#args.address1#" city="#args.city#" state="#args.state#" zip="#args.zip#" returnvariable="latlon">
					<cfset args.lat=latlon.lat>
					<cfset args.lon=latlon.lon>
				</cfif>
			</cfif>
		</cfif>
	</cfif>
	
	<cfloop list="#databasesToSync#" index="databasename">
		<cftransaction>
			<cfinvoke component="#application.abCFC#" method="addContactWithNameID" contactdsn="#databasename#" argumentcollection="#args#">
		</cftransaction>
	</cfloop>
	<cfloop list="#Session.mygroups#" index="groupid">
		<cfinvoke component="#application.abCFC#" method="addContactToGroup" contactdsn="#client.siteurl#" nameid="#args.nameid#" groupid="#groupid#">
	</cfloop>
</cfloop>