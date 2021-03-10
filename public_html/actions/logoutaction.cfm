<cfset client.authenicated=0>
<cfset client.masternameid=0>
<cfset client.firstname="">
<cfset client.lastname="">
<cfset client.pagetogo="">
<cfset client.errorlist="">
<cfset client.message="">
<cfset client.siteid=0>
<cfset client.siteurl=0>
<cfset client.roleid=0>
<cfset client.sites="">
<cfset session.acl=StructNew()>
<cfset session.acl.sections="">
<cfset session.acl.modules=StructNew()>
<cflocation url="/cms/login" addtoken="false">