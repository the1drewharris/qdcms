<cfset thereIsError=TRUE>
<cfif url.userid NEQ 0 AND isNumeric(url.userid)>
	<cfinvoke component="#application.objqdsecurity#" method="getUserInfo" nameid="#url.userid#" returnvariable="userinfo">
	<cfinvoke component="#application.objqdsecurity#" method="getSitesWithPermission" userid="#url.userid#" returnvariable="siteinfo">
	<cfif userinfo.recordcount GT 0>
		<cfset thereIsError=FALSE>
		<cfset Session.formValues['nameid']=url.userid>
		<cfset Session.formValues['firstname']=userinfo.firstname>
		<cfset Session.formValues['lastname']=userinfo.lastname>
		<cfset Session.formValues['wemail']=userinfo.wemail>
		<cfset Session.formValues['company']=userinfo.company>
		<cfset Session.formValues['title']=userinfo.title>
		<cfset Session.formValues['myusername']=userinfo.username>
		<cfset Session.formValues['mypassword']=userinfo.password>
		<cfset Session.formValues['confirm']=userinfo.password>
		<cfset Session.formValues['address1']=userinfo.address1>
		<cfset Session.formValues['address2']=userinfo.address2>
		<cfset Session.formValues['city']=userinfo.city>
		<cfset Session.formValues['state']=userinfo.state>
		<cfset Session.formValues['zip']=userinfo.zip>
		<cfset Session.formValues['hphone']=userinfo.hphone>
		<cfset Session.formValues['wphone']=userinfo.wphone>
		<cfset Session.formValues['mphone']=userinfo.mphone>
		<cfset client.usersites=ValueList(siteinfo.siteid)>
		<cfif siteinfo.recordcount GT 0>
			<cfloop query="siteinfo">
				<cfset Session.formValues['siteid#siteid#']=siteid>
			</cfloop>
		</cfif>
	<cfelse>
		<cfset client.message="User not found">
	</cfif>
</cfif>
<!---
<cfif thereIsError>
	<cflocation url="/cms/administration/users" addtoken="false">
</cfif>
--->