<cfparam name="url.fileid" default="0">
<cfif url.fileid NEQ 0>
	<cfif NOT thereAreErrors>
		<cfinvoke component="#application.objfile#" method="getnonmediafiles" filedsn="#client.siteurl#" fileid="#url.fileid#" returnvariable="myfile">
		<cfset session.formvalues['fileid']=myfile.fileid>
		<cfset session.formvalues['displayname']=myfile.displayname>
		<cfset session.formvalues['sortorder']=myfile.sortorder>
	</cfif>
</cfif>