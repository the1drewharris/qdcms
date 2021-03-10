<cfparam name="url.domain" default="0">
<cfobject component="bloggin" name="objbloggin">
<cfif url.domain NEQ 0>
	<cfinvoke component="#objbloggin#" method="createRSS" domain="#url.domain#">
	<cfinvoke component="#objbloggin#" method="createRSSForBlogs" domain="#url.domain#">
</cfif>
<cfinclude template="/actions/tracking.cfm">