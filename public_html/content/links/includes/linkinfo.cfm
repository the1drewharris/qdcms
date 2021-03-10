<cfparam name="url.linkid" default="0">
<cfset errorOccured=FALSE>
<cfif NOT thereAreErrors>
	<cfif url.linkid EQ 0>
		<cfset errorOccured=TRUE>
	<cfelse>
		<cfinvoke component="#application.objlinks#" method="getLinks" ds="#client.siteurl#" linkid="#url.linkid#" returnvariable="myLink">
		<cfif myLink.recordcount GT 0>
			<cfset session.formValues['linkid']=myLink.linkid>
			<cfset session.formValues['name']=myLink.name>
			<cfset session.formValues['href']=myLink.href>
			<cfset session.formValues['title']=myLink.title>
			<cfset session.formValues['target']=myLink.target>
		<cfelse>
			<cfset errorOccured=TRUE>
		</cfif>
	</cfif>
<cfelse>
	<cfset errorOccured=TRUE>
</cfif>

<cfif errorOccured>
	<cflocation url="/cms/content/links/showlinks" addtoken="false">
</cfif>