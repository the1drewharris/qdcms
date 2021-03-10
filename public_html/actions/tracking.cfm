<cfparam name="request.stream" default="0">
<cfif request.stream neq "0">
	<cfsavecontent variable="request.newStream">
	<cfoutput>#client.firstname# #client.lastname# #request.stream# in #url.module#.</cfoutput>
	</cfsavecontent>
	<cfinvoke component="#application.objtracking#" method="addDashStream" ds="#client.siteurl#" masternameid="#client.masternameid#" stream="#request.newStream#">
</cfif>