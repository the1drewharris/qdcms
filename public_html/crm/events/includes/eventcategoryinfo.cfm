<cfinvoke component="#application.objevent#" method="getCategories" eventcategoryid="#url.eventcategoryid#" status="all" eventdsn="#client.siteurl#" returnVariable="thiscategory">
<cfif thiscategory.recordcount EQ 1>
	<cfset Session.formvalues.eventcategoryid=thiscategory.eventcategoryid>
	<cfset Session.formvalues.eventcategory=thiscategory.eventcategory>
	<cfset Session.formvalues.status=thiscategory.status>
	<cfset Session.formvalues.description=thiscategory.description>
</cfif>
