<!--- 
	Q: what we know?
	A: Which columns to map from excel spreadsheet and database.
	
	Objective: Add contacts in spreadsheet to addressbook.
	
	Process:
	
	1. Read excel file and put the data in an array.
	2. Add each contact to the database.
	
	Two ways to do this
	1. Add each contact to the database one by one. 
	2. Bulk add: Add all contacts to addressbook in batches.
	
	Problem with bulk add
	1. We have to populate two tables. For each record we insert, we need a nameid returned.
	
	Decided to go with one due to inablity to overcome the Problem 1.
	
	This file is called via ajax. 
--->
<cfoutput>
	<!--- <cfset refererShouldBe='http://#application.dsn#/cms/#url.section#/#url.module#/addtoaddressbook'>
	<cfif CGI.HTTP_REFERER EQ refererShouldBe> --->
		<cfinclude template="../includes/listofabcolumns.cfm">
		<cfset args.contactdsn=client.siteurl>
		<cfobject component="excelFileHandler" name="objexcelfilehandler">
		<cfset objexcelfilehandler.init()>
		<cfset data=objexcelfilehandler.excelToArray(Session.uploadedfilepath)>
		<cfset noofrows=ArrayLen(data)>
		<cfset databasesToSync=Application.objsite.getDatabasesToSync(client.siteid)>
		<cfif noofrows GTE 1>
			DBC=<cfdump var="#form.dbc#"><br />
			form.xlc=<cfdump var="#form.xlc#"><br />
			<cfset noofcols=listlen(form.dbc)>
			<cftry>
				<cfif listlen(databasesToSync) EQ 0>
					<cftransaction>
						<cfloop from="1" to="#noofrows#" index="row">
							<cfset args=StructNew()>
							<cfloop from="1" to="#noofcols#" index="i">
								<cfset column=columndb[listGetAt(form.dbc,i)]>
								<cfset args['#column#']=data[row][listGetAt(form.xlc,i)]>
							</cfloop>
							<cfinvoke component="#application.abCFC#" method="addcontact" contactdsn="#client.siteurl#" argumentcollection="#args#" returnvariable="nameid">
							<cfloop list="#Session.mygroups#" index="groupid">
								<cfinvoke component="#application.abCFC#" method="addcontactToGroup" contactdsn="#client.siteurl#" groupid="#groupid#" nameid="#nameid#">
							</cfloop>
						</cfloop>
					</cftransaction>
					<cfif listcontainsnocase('#client.siteurl#','jbfsale','.')>
						<cfquery name="updateClientUserid" datasource="#ds#">
						update NAME
					       set CLIENTUSERID = cast(floor(CLIENTUSERID) as int)
						</cfquery>
					</cfif>
				<cfelse>
					<cfinclude template="syncaddtoaddressbook.cfm">
				</cfif>
				<cfset client.message="#noofrows# contacts imported to addressbook">
				<cfinclude template="/actions/tracking.cfm">
				<cfcatch type="any">
					<cfset client.message=cfcatch.message & client.message>
				</cfcatch>
			</cftry>
		</cfif>
		<!---Clean up  --->
		<cfset structDelete(Session,'mygroups',false)>
		<cfset structDelete(Session,'columnxl',false)>
		<cfset structDelete(Session,'uploadedfilepath',false)>
	<!--- </cfif> --->
</cfoutput>
<cfabort>