<cfset ops=form.id>
<cfset status=application.objvideolib.getVideoStatus(client.siteurl,form.id)>
<cfif status EQ 'Private'>
	<cfset newstatus="Public">
	<cfset ops=listAppend(ops,'1')>
<cfelse>
	<cfset newstatus="Private">
	<cfset ops=listAppend(ops,'0')>
</cfif>
<cftransaction>
	<cfset application.objvideolib.updateVideoStatus(client.siteurl,form.id,newstatus)>
</cftransaction>
<cfinclude template="/actions/tracking.cfm">
<cfoutput>#ops#</cfoutput>