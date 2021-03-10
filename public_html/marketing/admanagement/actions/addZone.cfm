<cftransaction>
	<cfinvoke component="#application.objadmanagement#" method="addZoneContainer" admanagementdsn="#client.siteurl#"
		width = "250"
		height = "300"
		maxzones = "1"
		description="Optometrist250x300b" returnVariable="zoneContainerID" />
		
	<cfinvoke component="#application.objadmanagement#" method="addZone" admanagementdsn="#client.siteurl#"
		zonecontainerid="#zoneContainerID#"
		moduleid="1"
		description="Optometrist250x300b" returnvariable="zoneid" />
</cftransaction>

<cfoutput>#zoneid#</cfoutput>