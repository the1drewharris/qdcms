<cfinclude template="validateuserprofileform.cfm"> <!--- There should be new validateform file for each form. --->
<cfif thereAreNoErrorsInForm>
	<cfset form.contactdsn=application.masterdsn>
	<cftransaction>
		<cfinvoke component="#application.abCFC#" method="updateContact" argumentcollection="#form#">
	</cftransaction>
	<cflocation url="/cms/#url.section#/#url.module#/profileupdated" addtoken="false">
<cfelse>
	<cflocation url="#CGI.HTTP_REFERER#" addtoken="false">
</cfif>