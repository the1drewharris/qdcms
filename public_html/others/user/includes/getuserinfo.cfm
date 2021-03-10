<cfif NOT thereAreErrors>
	<cfinvoke component="#application.objqdsecurity#" method="getUserInfo" nameid="#client.masternameid#" returnvariable="userinfo">
	<cfset Session.formValues['mynameid']=client.masternameid>
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
</cfif>