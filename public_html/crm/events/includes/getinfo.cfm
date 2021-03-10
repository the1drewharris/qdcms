<cfparam name="url.nameid" default="0">
<cfparam name="url.type" default="contact">
<cfif url.nameid NEQ 0 AND url.nameid NEQ "New">
	<cfinvoke component="#application.abCFC#" method="getContactInfo" contactdsn="#client.siteurl#" nameid="#url.nameid#" returnvariable="thisContact">
	<cfif url.type EQ "location">
		<cfset info="#url.type#,#thiscontact.company#,#thiscontact.wphone#,#thiscontact.wemail#,#thiscontact.address1#,#thiscontact.address2#,#thiscontact.city#,#thiscontact.state#,#thiscontact.zip#">
	<cfelse>
		<cfset info="#url.type#,#thiscontact.firstname#,#thiscontact.lastname#,#thiscontact.wphone#,#thiscontact.wemail#,#thiscontact.address1#,#thiscontact.address2#,#thiscontact.city#,#thiscontact.state#,#thiscontact.zip#">
	</cfif>
<cfelse>
	<cfset info="#url.type#, , , , , , , , ,">
</cfif>
<cfoutput>#info#</cfoutput>