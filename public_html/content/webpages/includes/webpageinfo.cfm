<cfparam name="url.w" default="0">
<cfparam name="url.createdon" default="0">
<cfif isNumeric(url.w)>
	<cfset args=StructNew()>
	<cfset args.webdsn=client.siteurl>
	<cfset args.wpid=url.w>
	<cfif url.createdon NEQ '0'>
		<cfset args.version=url.createdon>
	</cfif>
	<cfinvoke component="#application.objwebpage#" method="getPageInfo" argumentcollection="#args#" returnvariable="pageinfo">
	<cfif pageInfo.recordcount GT 0>
		<cfset session.formValues['wpid']=pageinfo.wpid>
		<cfset session.formValues['pid']=pageinfo.pid>
		<cfset session.formValues['name']=pageinfo.name>
		<cfset session.formValues['wpcontent']=pageinfo.wpcontent>
		<cfset session.formValues['title']=pageinfo.title>
		<cfset session.formValues['keywords']=pageinfo.keywords>
		<cfset session.formValues['description']=pageinfo.description>
		<cfset session.formValues['previousVersions']=pageinfo.createdon>
		<cfset session.formValues['wpstatus']=pageinfo.wpstatus>
	</cfif>
</cfif>