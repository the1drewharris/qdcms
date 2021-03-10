<!--- 
	Steps
	1. Is it a valid site id?
		N: Return to select site page
		Y: Go to step 2
	2. Include aclaction
	3. Get Site info
	:End 
--->

<cfparam name="url.siteid" default="0">
<cfif application.objsite.isSiteId(url.siteid)> <!--- 1. Is valid site? --->
	<cfinclude template="/actions/aclaction.cfm">
	<cflocation url="/" addtoken="false">
<cfelse>
	<cfset client.message="Invalid site id">
	<cflocation url="/cms/pickasite" addtoken="false">
</cfif>