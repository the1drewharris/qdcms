<cfinclude template="validatealbumform.cfm">
<cfif thereAreNoErrorsInForm>
	<cfset form.videodsn=client.siteurl>
	<cftransaction>
		<cfinvoke component="#application.objvideolib#" method="addcategory" argumentcollection="#form#" returnvariable="id">
	</cftransaction>
	<cfinclude template="/actions/tracking.cfm">
	<cflocation url="/cms/#url.section#/#url.module#/showvideoalbums" addtoken="false">
<cfelse>
	<cflocation url="#CGI.HTTP_REFERER#" addtoken="false">
</cfif>