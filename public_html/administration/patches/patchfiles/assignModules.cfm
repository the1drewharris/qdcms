<cfset ds=client.siteurl>
<cfset thisSiteid=client.siteid>
<cfset upgradeWasSuccessful=TRUE>
<cftry>
	<cfset allmodules="1,2,3,4,5,6,11,12,19,20,23,28,29">
	<cfloop list="#allmodules#" index="moduleid">
		<cfinvoke component="#application.objqdsecurity#" method="addModulesToSite" siteid="#thissiteid#" moduleid="#moduleid#">
	</cfloop>
	<cfcatch type="any">
		<cfset upgradeWasSuccessful=FALSE>
	</cfcatch>
</cftry>