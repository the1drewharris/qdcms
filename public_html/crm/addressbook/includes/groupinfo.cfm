<cfif NOT thereAreErrors>
	<cfinvoke component="#application.abCFC#" method="getGroupInfo" contactdsn="#client.siteurl#" groupid="#url.groupid#" returnVariable="thisGroup" />
	<cfif thisGroup.recordcount LTE 0>
		<cflocation url="/cms/crm/addressbook/showgroups" addtoken="false">
	<cfelse>
		<cfset Session.formValues['groupid']=Trim(url.groupid)>
		<cfset Session.formValues['parentusergroupid']=thisGroup.parentid>
		<cfset Session.formValues['usergroupname']=thisGroup.name>
		<cfset Session.formValues['status']=thisGroup.status>
		<cfset Session.formValues['usergroupdescription']=thisGroup.description>
		<cfset Session.formValues['keywords']=thisGroup.keywords>
	</cfif>
</cfif>