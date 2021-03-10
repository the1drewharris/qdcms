<cfif NOT thereAreErrors>
	<cfparam name="url.id" default="0">
	<cfset allgood=TRUE>
	<cfif isNumeric(url.id)>
		<cfinvoke component="#application.objproduct#" method="getProductGroups" productdsn="#client.siteurl#" id="#url.id#" returnvariable="productgroupinfo">
		<cfif productgroupinfo.recordcount GT 0>
			<cfset Session.formValues['id']=productgroupinfo.id>
			<cfset Session.formValues['itemname']=productgroupinfo.itemname>
			<cfset Session.formValues['subscriable']=productgroupinfo.subscriable>
			<cfif productgroupinfo.stopselling EQ 0>
				<cfset Session.formValues['startselling']=1>
			</cfif>
		<cfelse>
			<cfset allgood=FALSE>
		</cfif>
	<cfelse>
		<cfset allgood=FALSE>
	</cfif>
	<cfif NOT allgood>
		<cflocation url="/cms/#url.section#/#url.module#/showproductgroups" addtoken="false">
	</cfif>
</cfif>