<cfparam name="url.siteid" default="0">
<cfparam name="url.userid" default="0">
<cfoutput>
	<cfif url.siteid NEQ 0 AND url.userid NEQ 0>
		<cfif CGI.HTTP_REFERER EQ 'http://#application.thisSite#/cms/administration/users/editpermission/?userid=#url.userid#'>
			<cfinvoke component="#application.objqdsecurity#" method="getmodulesinsite" siteid="#url.siteid#" returnvariable="modulesinsite">
			<cfinvoke component="#application.objqdsecurity#" method="getModulesForUser" nameid="#url.userid#" siteid="#url.siteid#" returnvariable="modulesforuser">
			<cfloop query="modulesinsite">
				<cfset checked=FALSE>
				<cfif listfindnocase(modulesforuser,moduleid) GT 0>
					<cfset checked=TRUE>
				</cfif>
				<input type="checkbox" name="site#url.siteid#_module#moduleid#" value="#moduleid#" <cfif checked>Checked</cfif>>#caption#
			</cfloop>
		<cfelse>
			<cflocation url="/cms/accessdenied" addtoken="false">
		</cfif>
	</cfif>
</cfoutput>