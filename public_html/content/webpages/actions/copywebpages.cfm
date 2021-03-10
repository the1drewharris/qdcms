<cftransaction>
	<cfloop list="#url.wpList#" index="id">
		<cfinvoke component="#application.objwebpage#" method="getPageInfo" webdsn="#client.siteurl#" wpid="#id#" returnVariable="pageInfo" />
		<cfinvoke component="#application.objwebpage#" method="addPage" webdsn="#client.siteurl#"
			name="Copy of #pageInfo.name#"
			wpcontent="#pageInfo.wpcontent#"
			startdate="#pageInfo.startdate#"
			enddate="#pageInfo.enddate#"
			authorid="#pageInfo.authorid#"
			ignoreenddate="#pageInfo.ignoreenddate#"
			title="#pageInfo.title#"
			keywords="#pageInfo.keywords#"
			wpstatus="#pageInfo.wpstatus#"
			description="#pageInfo.description#"
		/>
	</cfloop>
</cftransaction>

<cfinclude template="/actions/tracking.cfm">

<cflocation url="/cms/content/webpages/viewWebPages" addToken="false"> 