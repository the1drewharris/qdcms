<cfinclude template="validateform.cfm">
<cfif thereAreNoErrorsInForm>
	<cfset form.filedsn=client.siteurl>
	<cfif listlen(client.siteurl,'.') LT 3>
		<cfset filedest="/home/drew/domains/#client.siteurl#/public_html/files">
	<cfelse>
		<cfset parentsite="#listGetAt(client.siteurl,2,'.')#.#listGetAt(client.siteurl,3,'.')#">
		<cfset subsiteFolder=listfirst(client.siteurl,'.')>
		<cfset filedest="/home/drew/domains/#parentsite#/public_html/#subsiteFolder#/files">
	</cfif>
	
	<cfif not directoryExists(filedest)>
		<cfdirectory action="create" directory="#filedest#" mode="775">
	</cfif>
	
	<cftransaction>
		<cffile action="upload" destination="#filedest#" fileField="file" nameconflict="unique"  result="myresult">
		<cfset form.serverfilename=myresult.serverfile>
		<cfinvoke component="#application.objfile#" method="addnonmediafile" argumentcollection="#form#" returnvariable="fileid">
	</cftransaction>
	<cfinclude template="/actions/tracking.cfm">
	<cflocation url="/cms/media/filemgmt/showfiles" addtoken="false">
<cfelse>
	<cflocation url="#CGI.HTTP_REFERER#" addtoken="false">
</cfif>