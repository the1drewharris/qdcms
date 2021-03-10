<cfset error=false>
<cfloop list="#NewsletterList#" index="newsletterid">
	<cftry>
		<cfinvoke component="#application.objNewsletter#" method="deletenewsletter" ds="#client.siteurl#" newsletterid="#newsletterid#">
		<cfschedule action="delete" task="#client.siteurl#_#newsletterid#">
		<cfcatch type="any">
			<cfinvoke component="#application.objNewsletter#" method="virtualdelete" ds="#client.siteurl#" newsletterid="#newsletterid#">
		</cfcatch>
	</cftry>
</cfloop>

<cfoutput>
	<cfsavecontent variable="client.quicknote">
		<div class="quicknote">
			<cfif not error>
				<h1>Newsletter(s) has been deleted successfully.</h1>
			<cfelse>
				<h1>Some Newsletters could not be deleted because of the data associated with it.</h1>
			</cfif>
		</div>
	</cfsavecontent>
</cfoutput>