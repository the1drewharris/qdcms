<cfloop list="#url.templateList#" index="id">
	<cfinvoke component="#application.objnewsletter#" method="deleteTemplate" ds="#client.siteurl#" templateid="#id#" />
</cfloop>
<cfset nooftemplate=ListLen(url.templateList)>
<cfoutput>
<cfsavecontent variable="client.quicknote">
<div class="quicknote">
	<h1> #nooftemplate# <cfif nooftemplate GT 1>Templates<cfelse>Template</cfif> deleted successfully</h1>
</div>
</cfsavecontent>
</cfoutput>