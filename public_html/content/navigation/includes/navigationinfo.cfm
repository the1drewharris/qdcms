<cfparam name="url.navid" default="">
<cfif isNumeric(url.navid)>
	<cfinvoke method="getNavigationInfo" ds="#client.siteurl#" navid="#url.navid#" returnvariable="navigationinfo">
	<cfif navigationinfo.recordcount GT 0>
		<cfset session.formvalues['name']=navigationinfo.navname>
		<cfset session.formvalues['status']=navigationinfo.status>
	<cfelse>
		<cflocation url="/cms/content/navigation/addnavigation" addtoken="false">
	</cfif>
</cfif>

<cffunction name="getNavigationInfo"  access="public" returntype="query" hint="I return: NAVID,NAVNAME,STATUS">
	<cfargument name="ds" required="true" type="string" hint="Database name">
	<cfargument name="navid" required="true" type="string" hint="navigation id">
	<cfset var get=0>
	<cfquery name="get" datasource="#arguments.ds#">
		SELECT TOP 1
			NAVID,
			NAVNAME,
			STATUS
		FROM NAVVERSION
		WHERE NAVID=<cfqueryparam value="#arguments.navid#" cfsqltype="cf_sql_varchar">
		ORDER BY NAVVERID DESC
	</cfquery>
	<cfreturn get>
</cffunction>