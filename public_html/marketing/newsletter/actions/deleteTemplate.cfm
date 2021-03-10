<cftransaction>
	<cfloop list="#url.templateList#" index="id">
		<cfinvoke component="#application.objnewsletter#" method="deleteTemplate" ds="#client.siteurl#" templateid="#id#" />
	</cfloop>
</cftransaction>
<cfinclude template="/actions/tracking.cfm">
<cfset nooftemplate=ListLen(url.templateList)>
<cfif nooftemplate GT 1>
	<cfset plural='s'>
<cfelse>
	<cfset plural=''>
</cfif>
<cfset client.message="#nooftemplate# Template#plural# deleted successfully">
<cflocation url="/cms/marketing/newsletter/managetemplates" addtoken="false">