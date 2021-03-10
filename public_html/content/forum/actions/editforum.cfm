<cfset form.ds=client.siteurl>
<cftransaction>
	<cfinvoke component="#application.objforum#" method="editforum" argumentcollection="#form#">
</cftransaction>
<cfinclude template="/actions/tracking.cfm">