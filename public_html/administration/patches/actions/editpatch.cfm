<cfinclude template="validatepatchform.cfm">
<cfif thereAreNoErrorsInForm>
	<cftransaction>
		<cfinvoke component="#application.objpatch#" method="updatePatch" argumentcollection="#form#">
	</cftransaction>
	<cflocation url="/cms/administration/patches/showpatches" addtoken="false">
<cfelse>
	<cflocation url="#CGI.HTTP_REFERER#" addtoken="false">
</cfif>