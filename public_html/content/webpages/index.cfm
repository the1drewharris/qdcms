<cfswitch expression="#url.action#">
	<cfcase value="actionmigratepages">
		<cfset request.stream="migrated web pages">
	</cfcase>
	<cfcase value="actionaddwptemplate">
		<cfset request.stream="added a web page template">
		<cfinclude template="actions/addwptemplate.cfm">
	</cfcase>
	<cfcase value="actioneditwptemplate">
		<cfset request.stream="edited a web page template">
		<cfinclude template="actions/editwptemplate.cfm">
	</cfcase>
	<cfcase value="actiondeletewptemplate">
		<cfset request.stream="deleted a web page template">
	</cfcase>
	<cfcase value="actioncopywptemplate">
		<cfset request.stream="copied a web page template">
	</cfcase>
	<cfcase value="actionrestorewptemplate">
		<cfset request.stream="restored a web page template">
	</cfcase>
	<cfcase value="actionaddwebpage">
		<cfset request.stream="added a web page">
		<cfinclude template="actions/addwebpage.cfm">
	</cfcase>
	<cfcase value="actioneditwebpage">
		<cfset request.stream="edited a web page">
		<cfinclude template="actions/editwebpage.cfm">
	</cfcase>
	<cfcase value="actiondelete">
		<cfset request.stream="deleted a web page">
	</cfcase>
	<cfcase value="delete">
		<cfset request.stream="deactivated a web page">
		<cfinclude template="actions/actiondeactivewebpages.cfm">
	</cfcase>
	<cfcase value="truedelete">
		<cfset request.stream="deleted a web page">
		<cfinclude template="actions/actiondeletewebpages.cfm">
	</cfcase>
	<cfcase value="restore">
		<cfset request.stream="restored a web page">
		<cfinclude template="actions/actionrestorewebpage.cfm">
	</cfcase>
	<cfcase value="actioncopy">
		<cfset request.stream="copied a web page">
		<cfinclude  template="actions/copywebpages.cfm">
	</cfcase>
	<cfcase value="imagebrowser">
		<cfset request.stream=0>
		<cfinclude template="/media/imagemgmt/actions/imageBrowser.cfm">
	</cfcase>
	<cfdefaultcase>
		<cfset request.stream=0>
		<cfinclude template="layout/default.cfm">
	</cfdefaultcase>
</cfswitch>