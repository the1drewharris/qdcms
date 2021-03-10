<cfinclude template="validateproductgroupform.cfm">
<cfif thereAreNoErrorsInForm>
	<cfparam name="form.startselling" default="0">
	<cfif form.startselling EQ 1>
		<cfset form.stopselling=0>
	<cfelse>
		<cfset form.stopselling=1>
	</cfif>
	<cfset form.productdsn=client.siteurl>
	<cftransaction>
		<cfinvoke method="editproductgroup" argumentcollection="#form#">
	</cftransaction>
	<cfinclude template="/actions/tracking.cfm">
	<cflocation url="/cms/#url.section#/#url.module#/showproductgroups" addtoken="false">
<cfelse>
	<cflocation url="#CGI.HTTP_REFERER#" addtoken="false">
</cfif>

<cffunction name="editproductgroup" access="public" output="false" returntype="void" hint="I edit product group">
	<cfargument name="productdsn" required="true" type="string" hint="Database name">
	<cfargument name="id" required="true" type="string" hint="id of the product group">
	<cfargument name="itemname" required="true" type="string" hint="Name of the product group">
	<cfargument name="subscriable" required="false" type="string" default="0" hint="1 if the item is subscriable">
	<cfargument name="stopselling" required="false" type="string" default="0" hint="1 if the item should not be sold">
	<cfset var update=0>
	<cfquery name="update" datasource="#arguments.productdsn#">
		UPDATE IDPOOL SET
			ITEMNAME=<cfqueryparam value="#arguments.itemname#">,
			SUBSCRIABLE=<cfqueryparam value="#arguments.subscriable#">,
			STOPSELLING=<cfqueryparam value="#arguments.stopselling#">
		WHERE ID=<cfqueryparam value="#arguments.id#">
	</cfquery>
	<cfreturn>
</cffunction>