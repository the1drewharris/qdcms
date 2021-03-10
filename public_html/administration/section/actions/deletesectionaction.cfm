<!--- Security required for this page --->

<cftransaction>
	<cfloop list="#url.sectionList#" index="sectionid">
		<cfinvoke component="#application.objqdsecurity#" method="removeSectionFromProducts" sectionid="#sectionid#">
		<cfinvoke component="#application.objqdsecurity#" method="removeModuleFromSection" sectionid="#sectionid#">
		<cfinvoke component="#application.objqdsecurity#" method="deleteSection" sectionid="#sectionid#">
	</cfloop>
</cftransaction>
<cfinvoke component="#application.objqdsecurity#" method="getSectionsInProduct" productid="#application.productid#" returnvariable="session.allsections">
<cflocation url="/cms/administration/section" addtoken="false">