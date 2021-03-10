<cftransaction>
	<cfinvoke component="#application.objforum#" method="ignoreReport" ds="#client.siteurl#" postList="#url.postList#">
</cftransaction>
<cfinclude template="/actions/tracking.cfm">
<cflocation url="/cms/content/forum/reportedPosts" addtoken="false">