<cfinclude template="validatetemplate.cfm">
<cfif thereAreNoErrorsInForm>
	<cftransaction>
		<cfset form.ds=client.siteurl>
		<cfif isDefined('form.imagepath') AND (Trim(form.imagepath) NEQ "")>
			<cfinclude template="/marketing/newsletter/actions/addTemplateImage.cfm">
			<cfset form.imagepath=newImageName>
		</cfif>
		<cfinvoke component="#application.objnewsletter#" method="addTemplate" argumentcollection="#form#">
	</cftransaction>
	<cfinclude template="/actions/tracking.cfm">
	<cflocation url="/cms/marketing/newsletter/managetemplates" addtoken="false">
<cfelse>
	<cflocation url="#CGI.HTTP_REFERER#" addtoken="false">
</cfif>