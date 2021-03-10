<cfset form.ds=client.siteurl>
<cftransaction>
	<cfinvoke component="#application.objforum#" method="addforum" argumentcollection="#form#">
</cftransaction>
<cfinclude template="/actions/tracking.cfm">