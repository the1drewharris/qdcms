<!--- 
Logic
	1. Is the form valid?
		N: return to edit page
		Y: Go to step 2
	2. Edit Contact
	3. Get difference of sites selected now and sites user have access to
	4. Add the newly selected site and remove ones that was selected earlier and now  not selected.
--->
<cfinclude template="validateform.cfm">
<cfset selectedSites="">
<cfif formIsValid>
	<cftransaction>
		<cfinvoke component="#application.abCFC#" method="updateContact" argumentcollection="#form#" contactdsn="#application.masterdsn#" mynameid="#mynameid#">
		<cfloop query="Session.sites">
			<cfif isDefined('form.siteid#siteid#')>
				<cfset selectedSites=ListAppend(selectedSites,siteid)>
			</cfif>
		</cfloop>
		<cfset sitediff=application.objtextconversion.getListDifference(selectedSites,client.usersites)>
		<cfloop list="#sitediff.a#" index="sitetoadd">
			<cfinvoke component="#application.objqdsecurity#" method="assignRoleToUser" siteid="#sitetoadd#" roleid="3" nameid="#form.nameid#">
		</cfloop>
		<cfloop list="#sitediff.b#" index="sitetoremove">
			<cfinvoke component="#application.objqdsecurity#" method="removeUserFromSite" nameid="#form.nameid#" siteid="#sitetoremove#">
		</cfloop>
	</cftransaction>
	<cflocation url="/cms/administration/users" addtoken="false">
<cfelse>
	<cflocation url="/cms/administration/users/edituser/?userid=#form.nameid#" addtoken="false">
</cfif>