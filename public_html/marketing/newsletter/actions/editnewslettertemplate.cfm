<cfinclude template="validatetemplate.cfm">
<cfif thereAreNoErrorsInForm>
	<cftransaction>
		<cfset form.ds=client.siteurl>
		<cfif form.imagepath NEQ "">
			<cfinclude template="/marketing/newsletter/actions/addTemplateImage.cfm">
			<cfset form.imagepath=newImageName>
		<cfelse>
			<cfset form.imagepath=0>
		</cfif>
		<cfinvoke component="#application.objnewsletter#" method="editTemplate" argumentcollection="#form#">
	</cftransaction>
	<cfinclude template="/actions/tracking.cfm">
	<cflocation url="/cms/marketing/newsletter/managetemplates" addtoken="false">
<cfelse>
	<cflocation url="#CGI.HTTP_REFERER#" addtoken="false">
</cfif>