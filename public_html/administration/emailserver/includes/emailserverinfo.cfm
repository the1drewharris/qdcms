<cfinvoke component="#application.objnewsletter#" method="getEmailServerInfo" ds="#client.siteurl#" serverid="#url.s#" returnvariable="emailserverinfo">
<cfset Session.formValues['serverid']=emailserverinfo.serverid>
<cfset Session.formValues['servername']=emailserverinfo.servername>
<cfset Session.formValues['port']=emailserverinfo.port>
<cfset Session.formValues['username']=emailserverinfo.username>
<cfset Session.formValues['password']=emailserverinfo.password>
<cfset Session.formValues['status']=emailserverinfo.status>