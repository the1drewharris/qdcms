<cfinclude template="validatecontactform.cfm">
<cfif thereAreNoErrorsInForm>
	<cfparam name="form.grouplist" default="">
	<cfparam name="client.referer" default="/cms/#url.section#/#url.module#/showcontacts">
	<cfset form.contactdsn=client.siteurl>
	<!--- <cftransaction> --->
		<cfdump var="#form#">
		<cfif Trim(form.state) EQ "0" and Trim(form.otherState) NEQ "">
				<cfset form.state=form.otherState>
		</cfif>
		<cfinvoke component="#application.abCFC#" method="updateContact" argumentcollection="#form#">
		<cfinvoke component="#application.abCFC#" method="removeContactFromAllGroups" contactdsn="#client.siteurl#" nameid="#form.mynameid#" />
		<cfloop list="#form.grouplist#" index="groupid">
			<cfinvoke component="#application.abCFC#" method="addContactToGroup" contactdsn="#client.siteurl#" nameid="#mynameid#" groupid="#groupid#">
		</cfloop>
		<cfif form.filedata NEQ ''>
			<cfset mynameid=form.mynameid>
			<cfset step=0>
			<cfinclude template="uploadprofilepic.cfm">
			<cfoutput >#step#</cfoutput>
			<!--- <cfabort > --->
		</cfif>
	<!--- </cftransaction> --->
	<cfinclude template="synceditcontact.cfm">
	<cfinclude template="/actions/tracking.cfm">
	<cfset client.message="The contact has been updated">
	<cflocation url="#client.referer#" addtoken="false">
<cfelse>
	<cflocation url="#CGI.HTTP_REFERER#" addtoken="false">
</cfif>