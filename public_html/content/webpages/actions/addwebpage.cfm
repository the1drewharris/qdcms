<!--- Steps
1. Validate form
2. Add webpage
3. Set pid
4. Set sortorder
5. Set Nest level=Nest level of parent + 1 --->

<cfinclude template="validatewpform.cfm">
<cfif thereAreNoErrorsInForm>
	<cfset form.webdsn=client.siteurl>
	<cfset form.startdate=application.objtimedateconversion.createtimedate()>
	<cfset form.enddate=application.objtimedateconversion.createtimedate()>
	<cfset form.authorid=client.masternameid>
	<cftransaction>
		<cfinvoke component="#application.objwebpage#" method="addPage" argumentcollection="#form#">
	</cftransaction>
	<cfinclude template="/actions/tracking.cfm">
	<cflocation url="/cms/content/webpages/viewwebpages" addtoken="false">
<cfelse>
	<cflocation url="#CGI.HTTP_REFERER#" addtoken="false">
</cfif>