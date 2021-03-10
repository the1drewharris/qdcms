<cfset ops=form.id>
<cfset status=application.objimagegallery.getImageStatus(client.siteurl,form.id)>
<cfif status EQ 'Pending'>
	<cfset status="Active">
	<cfset ops=listAppend(ops,'1')>
<cfelse>
	<cfset status="Pending">
	<cfset ops=listAppend(ops,'0')>
</cfif>
<cftransaction>
	<cfinvoke component="#application.objimagegallery#" method="updateImageStatus" imagedsn="#client.siteurl#" imageid="#form.id#" status="#status#">
</cftransaction>
<cfinclude template="/actions/tracking.cfm">
<cfoutput>#ops#</cfoutput>