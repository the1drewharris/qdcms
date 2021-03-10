<cfinclude template="validateuploadcontactsform.cfm">
<cfif thereAreNoErrorsInForm>
	<cfset destination="#client.sitepath#/files/uploadedxlfiles">
	<cfset allIsWell=TRUE>
	<cfif not directoryExists(destination)>
		<cfdirectory action="create" directory="#destination#" mode="775">
	</cfif>
	<cftry>
		<cffile action="upload" filefield="filedata" destination="#destination#" nameconflict="makeUnique" result="xlfile">
		<cfcatch type="any">
			<cfset allIsWell=FALSE>
			<cfset client.message=cfcatch.message>
		</cfcatch>
	</cftry>
	<cfif allIsWell eq TRUE>
		<cfobject component="excelFileHandler" name="objexcelfilehandler">
		<cfset objexcelfilehandler.init()>
		<cfset Session.mygroups=form.grouplist>
		<cfset Session.uploadedfilepath="#destination#/#xlfile.serverfile#">
		<cfset Session.columnxl=objexcelfilehandler.getcolumnsAsArray(Session.uploadedfilepath)>
		<cflocation url="/cms/#url.section#/#url.module#/addtoaddressbook" addtoken="false">
	<cfelse>
		<cflocation url="#CGI.HTTP_REFERER#" addtoken="false">
	</cfif>
<cfelse>
	<cflocation url="#CGI.HTTP_REFERER#" addtoken="false">
</cfif>