<!--- 
Steps:
	1. Validate form
	2. add contact
	3. Add group
	4. If there is an image, add it. It generates error message if image can not up uploaded for some reason
	5. If no error, update contact with the image 
--->

<cfinclude template="validatecontactform.cfm">
<cfparam name="form.grouplist" default="">
<cfparam name="form.filedata" default="">
<cfif thereAreNoErrorsInForm>
	<cfset form.contactdsn=client.siteurl>
	<cfset databasesToSync=Application.objsite.getDatabasesToSync(client.siteid)>
	<cfif listlen(databasesToSync) EQ 0>
		<cftransaction>
			<cfif Trim(form.state) EQ "0" and Trim(form.otherState) NEQ "">
				<cfset form.state=form.otherState>
		    </cfif>
			<cfinvoke component="#application.abCFC#" method="addContact" argumentcollection="#form#" returnvariable="mynameid">
			<cfloop list="#form.grouplist#" index="groupid">
				<cfinvoke component="#application.abCFC#" method="addContactToGroup" contactdsn="#client.siteurl#" nameid="#mynameid#" groupid="#groupid#">
			</cfloop>
			<cfif form.filedata NEQ ''>
				<cfinclude template="uploadprofilepic.cfm">
			</cfif>
		</cftransaction>
	<cfelse>
		<cfinclude template="syncaddcontact.cfm">
	</cfif>
	<cfinclude template="/actions/tracking.cfm">
	<cflocation url="/cms/crm/addressbook/showcontacts" addtoken="false">
<cfelse>
	<cflocation url="#CGI.HTTP_REFERER#" addtoken="false">
</cfif>