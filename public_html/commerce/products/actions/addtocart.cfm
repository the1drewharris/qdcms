<cfparam name="form.id" default="0">
<cfparam name="form.cartid" default="0">
<cfset allIsWell=FALSE>
<cfif isNumeric(form.id) AND form.id GT 0>
	<cfif isNumeric(form.cartid) AND form.cartid GT 0>
		<cfquery name="getidfor" datasource="#client.siteurl#">
			SELECT IDFOR FROM IDPOOL WHERE ID=<cfqueryparam value="#form.id#" cfsqltype="cf_sql_varchar">
		</cfquery>
		<cfif getidfor.recordcount GT 0>
			<cfset allIsWell=TRUE>
		</cfif>
	</cfif>
</cfif>

<cfif allIsWell>
	<cfif getidfor.idfor EQ "Product">
		<cfinvoke component="newcart" method="addproduct" cartdsn="#client.siteurl#" id="#form.id#" cartid="#form.cartid#" returnvariable="message">
	<cfelseif getidfor.idfor EQ "Subscriptionplan">
		<cfinvoke component="newcart" method="addsubscription" cartdsn="#client.siteurl#" id="#form.id#" cartid="#form.cartid#" returnvariable="message">
	</cfif>
	<cfinclude template="/actions/tracking.cfm">
</cfif>

<cflocation url="#CGI.http_referer#" addtoken="false">