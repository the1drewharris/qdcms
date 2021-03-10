<cftransaction>
		<cfinvoke component="#application.objwebpage#" method="updateWPStatus" webdsn="#client.siteurl#" wpid="#url.w#" mystatus="Published">
</cftransaction>

<cfinclude template="/actions/tracking.cfm">

<cflocation url="/cms/content/webpages/viewWebPages" addToken="false"> 