<cfparam name="url.t" default="g">
<cfparam name="url.d" default="0">
<cfparam name="form.l" default=0>
<cfset timenow=application.objtimedateconversion.createtimedate()>
<cfset TabChar = Chr(9)>
<cfset NewLine = Chr(13) & Chr(10)>
<cfset cardname="qdcms_export_#timenow#">
<cfif url.t EQ 'a'>
	<cfset args=session.searchArguments>
	<cfinvoke component="#application.abCFC#" method="getNameIdsOfContacts" contactdsn="#client.siteurl#" argumentcollection="#args#" returnvariable="contacts">
<cfelseif url.d NEQ '0'>
	<cfif listfindnocase('name,address,clientuserid,username,hemail,wemail',url.d) GT 0>
		<cfinvoke component="#application.abCFC#" method="getNameIdsOfDuplicates" contactdsn="#client.siteurl#" dup="#url.d#" returnvariable="contacts">
	</cfif>
<cfelse>
	<cfinvoke component="#application.abCFC#" method="quickSearchNameIds" contactdsn="#client.siteurl#" groupid="#url.g#" searchkey="#client.searchkey#" returnvariable="contacts">
</cfif>
<cfset contactslist=ValueList(contacts.nameid,",")>
<cfif form.l EQ 1>
	<cfinvoke component="#application.abCFC#" method="jbfLegacyExport" contactdsn="#client.siteurl#" nameids="#contactslist#" returnvariable="myCSV">
<cfelse>
	<cfinvoke component="#application.abCFC#" method="makeCSV" contactdsn="#client.siteurl#" argumentcollection="#form#" nameids="#contactslist#" returnvariable="myCSV">
</cfif>
<cfsetting enablecfoutputonly="Yes">
<cfheader name="Content-Disposition" value="inline; filename=#cardname#.xls">
<cfcontent type="application/vnd.msexcel" >
<cfoutput>#myCSV#</cfoutput>