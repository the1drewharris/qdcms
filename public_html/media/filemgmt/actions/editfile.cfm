<cfinclude template="validateform.cfm">
<cfif thereAreNoErrorsInForm>
	<cfset form.filedsn=client.siteurl>
	<cfif form.file NEQ "">
		<cfif listlen(client.siteurl,'.') LT 3>
			<cfset filedest="/home/drew/domains/#client.siteurl#/public_html/files">
		<cfelse>
			<cfset parentsite="#listGetAt(client.siteurl,2,'.')#.#listGetAt(client.siteurl,3,'.')#">
			<cfset subsiteFolder=listfirst(client.siteurl,'.')>
			<cfset filedest="/home/drew/domains/#parentsite#/public_html/#subsiteFolder#/files">
		</cfif>
		<cffile action="upload" destination="#filedest#" filefield="file" nameconflict="unique">
		<cfset form.serverfilename=serverfile>
	<cfelse>
		<cfset form.serverfilename="0">
	</cfif>
	<cftransaction>
		<cfinvoke component="#application.objfile#" method="editnonmediafile" argumentcollection="#form#">
	</cftransaction>
	<cfinclude template="/actions/tracking.cfm">
	<cflocation url="/cms/media/filemgmt/showfiles" addtoken="false">
<cfelse>
	<cflocation url="#CGI.HTTP_REFERER#" addtoken="false">
</cfif>