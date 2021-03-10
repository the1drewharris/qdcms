<cftransaction>
	<cfinvoke component="#application.objreview#" method="editReview" reviewdsn="#client.siteurl#" argumentcollection="#form#">
</cftransaction>
<cfinclude template="/actions/tracking.cfm">
<cflocation url="/cms/crm/addressbook/reviews/?id=#form.contactid#" addtoken="false">
