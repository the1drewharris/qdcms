<cfinclude template="validateform.cfm"> <!--- There should be new validateform file for each form. --->
<cfif thereAreNoErrorsInForm>
	<cfset form.ds=client.siteurl>
	<cftransaction>
		write your code here
	</cftransaction>
	<cfinclude template="/actions/tracking.cfm">
	<cflocation url="/cms/#url.section#/#url.module#/show" addtoken="false">
<cfelse>
	<cflocation url="#CGI.HTTP_REFERER#" addtoken="false">
</cfif>