<cftransaction>
	<cfloop list="#url.templateList#" index="id">
		<cfinvoke component="#application.objnewsletter#" method="getTemplate" ds="#client.siteurl#" newslettertemplateid="#id#" returnVariable="MyTemplate"/>
		<cfset args=structNew()>
		<cfset args.ds=client.siteurl>
		<cfset args.name="Copy of #myTemplate.name#">
		<cfset args.template=MyTemplate.template>
		<cfset args.description=MyTemplate.description>
		<cfset args.imagepath=MyTemplate.imagepath>
		<cfset args.status=MyTemplate.status>
		<cfinvoke component="#application.objnewsletter#" method="addTemplate" argumentcollection="#args#" returnvariable="templateid">
	</cfloop>
</cftransaction>
<cfset nooftemplate=ListLen(url.templateList)>
<cfif nooftemplate GT 1>
	<cfset plural='s'>
<cfelse>
	<cfset plural=''>
</cfif>
<cfset client.message="#nooftemplate# Template#plural# copied successfully">
<cfinclude template="/actions/tracking.cfm">
<cflocation url="/cms/marketing/newsletter/managetemplates" addtoken="false">