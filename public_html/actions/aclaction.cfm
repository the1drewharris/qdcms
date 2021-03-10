<!--- 
	Steps
	1. Check if the user has permission for the site
	2. If the user has permission Begin:
		2.1 set client.siteid=url.siteid
		2.2 set client.siteurl=url of the site
		2.3 set session.acl.sections=list of sections the user has access to
		2.4 set session.acl.modules['section']=list of modules the user has access to in particular section
	:End-
--->

<cfset client.dashboardallowed=FALSE>
<cfif listfindnocase(client.allowedsites,url.siteid) GT 0 OR client.roleid EQ 7>
	<cfset client.siteid=url.siteid>
	<!--- Update the last siteid field for this person in the master database --->
	<cfinvoke component="#application.objtracking#" 
		method="updateMasterLastSiteid" 
		ds="#application.masterdsn#" 
		nameid="#client.masternameid#" 
		siteid="#client.siteid#">
	<cfinvoke component="#application.objsite#" method="getSiteInfo" siteid="#client.siteid#" returnvariable="allSiteInfo">
	<cfset client.siteurl=allSiteInfo.siteurl>
	<cfset client.parentsiteid=allSiteInfo.parentid>
	<cfif client.parentsiteid neq 0>
		<cfset client.parentsiteurl=application.objsite.getSiteUrl(client.parentsiteid)>
	<cfelse>
		<cfset client.parentsiteurl = 0>
	</cfif>
	<cfset args=StructNew()>
	<cfif client.siteurl neq "jbfsale.com">
		<cfinclude template="/actions/applypatches.cfm">
	</cfif>
	<cfinvoke component="#application.objqdsecurity#" method="getAcl" nameid="#client.masternameid#" siteid="#client.siteid#" returnvariable="session.acl">
	<cfset client.roleid=session.acl.roleid>
	<cfif listlen(session.acl.aclids) GT 0>
		<cfinvoke component="#application.objqdsecurity#" method="getNavigation" productid="#application.productid#" aclids="#session.acl.aclids#" returnvariable="myNav">
		<cfset session.myNav=XmlParse(myNav).Navigation>
		<!--- <cfif client.siteurl neq "jbfsale.com"> --->
			<cfset client.dashboardallowed=TRUE>
		<!--- </cfif> --->
		<cfset parentsiteurl=application.objsite.getParentSiteUrl(client.siteid)>
		<cfif len(parentsiteurl) AND listlen(client.siteurl,'.') EQ 3>
			<cfset subsite=listFirst(client.siteurl,'.')>
			<cfset client.sitepath="/home/drew/domains/#parentsiteurl#/public_html/#subsite#">
			<cfset client.imagepath="http://dev.quantumdelta.com/#parentsiteurl#/public_html/#subsite#/images">
			<cfset client.filepath="http://dev.quantumdelta.com/#parentsiteurl#/public_html/#subsite#/files">
			<cfset client.devpath="http://dev.quantumdelta.com/#parentsiteurl#/public_html/#subsite#">
		<cfelse>
			<cfset client.sitepath="/home/drew/domains/#client.siteurl#/public_html">
			<cfset client.imagepath="http://dev.quantumdelta.com/#client.siteurl#/public_html/images">
			<cfset client.filepath="http://dev.quantumdelta.com/#client.siteurl#/public_html/files">
			<cfset client.devpath="http://dev.quantumdelta.com/#client.siteurl#/public_html">
		</cfif>
	<cfelse>
		<cfset structdelete(session,'myNav',FALSE)>
		<cfset client.message="You do not have access to any modules in the site">
		<cflocation url="/cms/pickasite" addtoken="false">
	</cfif>
</cfif>