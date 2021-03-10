<!--- 
Logic 
	1. Is the form Valid?
		N: Go to add page
		Y: Go to step 2
	2. Add user
	3. Add user to site.
--->
<cfinclude template="validateform.cfm">
<cfif formIsValid>
	<cftransaction>
		<cfinvoke component="#application.abCFC#" method="addcontact" argumentcollection="#form#" contactdsn="#application.masterdsn#" returnvariable="nameid">
		<cfloop list="#sitesSelected#" index="site">
			<cfinvoke component="#application.objqdsecurity#" method="assignRoletoUser" nameid="#nameid#" roleid="0" siteid="#site#">
		</cfloop>
	</cftransaction>
	<cflocation url="/cms/administration/users/showusers" addtoken="false">
<cfelse>
	<cflocation url="/cms/administration/users/adduser" addtoken="false">
</cfif>