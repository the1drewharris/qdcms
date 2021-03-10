<cfinvoke component="#application.objwebpage#" method="getPages" webdsn="#client.siteurl#" returnVariable="getPages" />
<cfinvoke component="#application.objlinks#" method="getLinks" ds="#client.siteurl#" returnVariable="getLinks" />
<cfquery name="makeTree" dbtype="query">
	SELECT 
		PID AS PARENT,
		WPID AS ID,
		WPID,
		WPID AS NESTLEVEL,
		NAME,
		WPSTATUS,
		CREATEDON
	FROM GETPAGES
	ORDER BY CREATEDON ASC
</cfquery>

<cfinvoke component="tree" method="makeBranches" theQuery="#makeTree#" nestLevel="0" returnVariable="getPagesWithNesting" />