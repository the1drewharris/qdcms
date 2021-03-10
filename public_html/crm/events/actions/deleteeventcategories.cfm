<cfloop list="#url.categoryList#" index="eventcategoryid">
	<cfinvoke component="#Application.objevent#" method="updateEventCat" ds="#client.siteurl#" eventcategoryid="#eventcategoryid#" status="Inactive">
</cfloop>
<cfinclude template="/actions/tracking.cfm">
<cflocation url="/cms/crm/events/listcategories" addToken="false">