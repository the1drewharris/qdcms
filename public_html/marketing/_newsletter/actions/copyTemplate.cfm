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
<cfset nooftemplate=ListLen(url.templateList)>
<cfoutput>
<cfsavecontent variable="client.quicknote">
<div class="quicknote">
	<h1> #nooftemplate# <cfif nooftemplate GT 1>Templates<cfelse>Template</cfif> copied successfully</h1>
</div>
</cfsavecontent>
</cfoutput>