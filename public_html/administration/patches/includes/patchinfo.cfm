<cfinvoke component="#application.objpatch#" method="getpatches" patchid="#url.patchid#" returnvariable="patchinfo">
<cfif patchinfo.recordcount EQ 0>
	<cfset client.message="The patch you select does not exist">
	<cflocation url="/cms/administration/patches/showpatches" addtoken="false">
<cfelse>
	<cfset Session.formValues['patchid']=patchInfo.patchid>
	<cfset Session.formValues['patchname']=patchInfo.patchname>
	<cfset Session.formValues['filename']=patchInfo.filename>
	<cfset Session.formValues['description']=patchInfo.description>
	<cfset Session.formValues['status']=patchInfo.status>
	<cfinvoke component="#application.objpatch#" method="getSitesThePatchHasBeenAppliedTo" patchid="#url.patchid#" returnvariable="sitesThePatchHasBeenAppliedTo">
</cfif>