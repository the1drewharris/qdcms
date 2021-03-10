<cfset n=listlen(form.i)>
<cftransaction>
	<cfloop list="#form.i#" index="videoid">
		<cfloop list="#form.a#" index="galleryid">
			<cfinvoke component="#application.objvideolib#" method="videoToCategory" videodsn="#client.siteurl#" vid="#videoid#" videocategoryid="#galleryid#">
		</cfloop>
	</cfloop>
</cftransaction>
<cfinclude template="/actions/tracking.cfm">
<cfif n GT 1>
	<cfset item='audios'>
<cfelse>
	<cfset item='audio'>
</cfif>
<cfoutput>#n# #item# copied</cfoutput>