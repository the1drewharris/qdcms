<cftransaction>
	<cfinvoke component="#application.objforum#" method="approveposts" ds="#client.siteurl#" postlist="#url.postList#">
</cftransaction>
<cfinclude template="/actions/tracking.cfm">
<cflocation url="/cms/content/forum/" addtoken="false">