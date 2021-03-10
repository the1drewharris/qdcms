<cfinclude template="validateaddfileform.cfm">
<cfif thereAreNoErrorsInForm>
	<cfset form.filedsn=client.siteurl>
	<cfset form.nameid=client.masternameid>
	<cfset form.path="#client.sitepath#/files/">
	<cftry>
		<cfif NOT DirectoryExists(form.path)>
			<cfdirectory action="create" directory="#form.path#" mode="775">
		</cfif>
		<cffile action="upload" filefield="file" destination="#form.path#" nameconflict="makeUnique" result="myfile">
		<cfset form.filename=application.objimagegallery.renamefile(form.path,myfile.serverFile,myfile.serverFileExt)>
		<cftransaction>
			<cfinvoke component="#application.objfile#" method="addfile" argumentcollection="#form#" returnvariable="form.fileid">
			<cfinvoke component="#application.objfile#" method="tiefiletoproduct" argumentcollection="#form#">
		</cftransaction>
		<cfinclude template="/actions/tracking.cfm">
		<cfcatch type="any">
			<cfset client.message="The file could not be added due to following error: #cfcatch.message#">	
		</cfcatch>
	</cftry>
	<cflocation url="/cms/#url.section#/#url.module#/viewalbum/?id=#form.albumid#" addtoken="false">
<cfelse>
	<cflocation url="#CGI.HTTP_REFERER#" addtoken="false">
</cfif>