<cfloop list="#url.newsletterList#" index="id">
	<cfinvoke component="#application.objnewsletter#" method="getNewsletter" ds="#client.siteurl#" newsletterid="#id#" returnVariable="getMyNewsletter"/>
	<cfdump var="#getMyNewsletter#">
	<cfset args=structNew()>
	<cfset args.ds=client.siteurl>
	<cfset args.name="Copy of #getMyNewsletter.name#">
	<cfset args.authorid=client.masternameid>
	<cfset args.replyto=getmyNewsletter.replyto>
	<cfset args.htmlnewsletter=getMyNewsletter.htmlnewsletter>
	<cfset args.sendfromname=getMyNewsletter.sendfromname>
	<cfset args.textnewsletter=getMyNewsletter.textnewsletter>
	<cfset args.subject=getMyNewsletter.subject>
	<cfif Trim(getMyNewsletter.newslettertemplateid) NEQ "">
	<cfset args.newslettertemplateid=getMyNewsletter.newslettertemplateid>
	</cfif>
	<cfinvoke component="#application.objnewsletter#" method="addNewsletter" argumentcollection="#args#" returnvariable="newsletterid">
</cfloop>
<cfset noofnewsletters=ListLen(url.newsletterList)>
<cfoutput>
<cfsavecontent variable="client.quicknote">
<div class="quicknote">
	<h1> #noofnewsletters# <cfif noofnewsletters GT 1>Newsletters<cfelse>Newsletter</cfif> copied successfully</h1>
</div>
</cfsavecontent>
</cfoutput>