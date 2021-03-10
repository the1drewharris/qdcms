<!--- 
	Steps 
		1. Make sure the form is valid.
		2. If image field is filled, upload the image and put it in Webpage Template Gallery, create thumbs
		3. Add Template 
--->
<cfinclude template="validatewptemplateform.cfm">
<cfif thereAreNoErrorsInForm>
	<cftransaction>
		<cfif Trim(form.Filedata) NEQ ''> 
			<cfinclude template="addtemplateimage.cfm">
		</cfif> 
		<cfset form.webdsn=client.siteurl>
		<cfset form.status="Published">
		<cfinvoke component="#Application.objwebpage#" method="addTemplate" argumentcollection="#form#">
	</cftransaction>
	<cfinclude template="/actions/tracking.cfm">
	<cflocation url="/cms/content/webpages/managewptemplates" addtoken="false">
<cfelse>
	<cflocation url="#CGI.HTTP_REFERER#" addtoken="false">
</cfif>