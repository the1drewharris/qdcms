<cfloop list="#NewsletterList#" index="newsletterid">
	<cftry>
		<cfinvoke component="#application.objNewsletter#" method="deletenewsletter" ds="#client.siteurl#" newsletterid="#newsletterid#">
		<cfschedule action="delete" task="#client.siteurl#_#newsletterid#">
		<cfcatch type="any">
			<cfinvoke component="#application.objNewsletter#" method="virtualdelete" ds="#client.siteurl#" newsletterid="#newsletterid#">
		</cfcatch>
	</cftry>
</cfloop>
<cfinclude template="/actions/tracking.cfm">
<cfset client.message="Newsletter(s) has been deleted successfully">
<cflocation url="/cms/marketing/newsletter/shownewsletters" addtoken="false">
