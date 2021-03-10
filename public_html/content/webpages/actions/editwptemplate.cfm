<cfinclude template="validatewptemplateform.cfm">
<cfif thereAreNoErrorsInForm>
	<cftransaction>
		<cfif Trim(form.Filedata) NEQ ''>
			<cfinclude template="addtemplateimage.cfm">
		</cfif>
		<cfset form.webdsn=client.siteurl>
		<cfinvoke component="#application.objwebpage#" method="updateTemplate" argumentcollection="#form#">
	</cftransaction>	
	<cfinclude template="/actions/tracking.cfm">
	<cflocation url="/cms/content/webpages/managewptemplates" addtoken="false">
<cfelse>
	<cflocation url="#CGI.HTTP_REFERER#" addtoken="false">
</cfif>