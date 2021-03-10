<cfif NOT thereAreErrors> <!--- thereAreErrors is defined in /display/errors.cfm --->
	<cfparam name="url.id" default="0">
	<cfif IsNumeric(url.id)>
		<cfif url.id GT 0>
			<cfinvoke component="#application.objvideolib#" method="getCategoryName" videodsn="#client.siteurl#" videocategoryid="#url.id#" returnvariable="thiscategory">
			<cfif thiscategory.recordcount EQ 0>
				<cflocation url="/cms/#url.section#/#url.module#/showvideoalbums" addtoken="false">
			<cfelse>
				<cfset Session.formValues['videocategoryid']=url.id>
				<cfset Session.formValues['category']=thiscategory.category>
			</cfif>
		</cfif>
	</cfif>
</cfif>