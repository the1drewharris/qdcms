<!--- 
This patch was created to:  
	ADD EVENTID TO NEWSLETTERTOUSERGROUP AND NEWSLETTERTOUSERGROUPEXCLUDE.
	DROP PRIMARY KEY FROM NEWSLETTERTOUSERGROUP AND NEWSLETTERTOUSERGROUPEXCLUDE. 
--->

<cfset ds=client.siteurl>
<cfset upgradeWasSuccessful=TRUE>
<cftry>
	<cfinvoke component="#application.objbuildtables#" method="createNewsletterTables" ds="#ds#">
	<cfcatch type="any">
		<cfset upgradeWasSuccessful=FALSE>
	</cfcatch>
</cftry>