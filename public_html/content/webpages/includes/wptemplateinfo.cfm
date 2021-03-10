<cfinvoke component="#application.objwebpage#" method="getTemplate" webdsn="#client.siteurl#" templateid="#url.templateid#" returnVariable="templateInfo">
<cfif templateInfo.recordcount GT 0>
	<cfset Session.formValues['templateid']=templateInfo.wptemplateid>
	<cfset Session.formValues['name']=templateInfo.name>
	<cfset Session.formValues['description']=templateInfo.description>
	<cfset Session.formValues['template']=templateInfo.template>
	<cfset Session.formValues['imagepath']=templateInfo.imagepath>
</cfif>