<cfinclude template="validateform.cfm">
<cfif thereAreNoErrorsInForm>
	<cftransaction>
		<cfset form.haudsn=client.siteurl>
		<cfinvoke component="#application.objhau#" method="addhauoption" argumentcollection="#form#" returnvariable="form.aboutusid">
		<cfset form.sortordervalue=application.objtextconversion.convertNumberToSortCode(form.aboutusid)>
		<cfinvoke component="#application.objhau#" method="setSortOrderAndNestLevel" argumentcollection="#form#">
	</cftransaction>
	<cfinclude template="/actions/tracking.cfm">
	<cflocation url="/cms/marketing/heardaboutus/showhauoptions" addtoken="false">
<cfelse>
	<cflocation url="#CGI.HTTP_REFERER#" addtoken="false">
</cfif>