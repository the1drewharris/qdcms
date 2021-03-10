<cfinvoke component="#application.objhau#" method="gethauoptions" haudsn="#client.siteurl#" aboutusid="#url.h#" returnvariable="hauoption">
<cfif hauoption.recordcount EQ 0>
	<cfset client.message="The Heard About Us Option does not exist">
	<cflocation url="/cms/marketing/heardaboutus/showoptions" addtoken="false">
<cfelse>
	<cfset Session.formValues['aboutus']=hauoption.aboutus>
	<cfset Session.formValues['aboutusid']=hauoption.aboutusid>
	<cfset Session.formValues['aboutusparentid']=hauoption.aboutusparentid>
	<cfset Session.formValues['status']=hauoption.status>
</cfif>