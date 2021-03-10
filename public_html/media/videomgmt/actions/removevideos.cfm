<cfparam name="url.l" default="">
<cfparam name="url.g" default="0">

<!--- 
	Begin: Validation Part 
	Explanation: making sure that request is coming from viewalbum action is sufficient to verify that it is a valid request
	r: referer
	a: alternate referer
--->

<cfset allIsWell=FALSE>
<cfset r='http://#application.dsn#/cms/#url.section#/#url.module#/viewalbum/?id=#url.g#'>
<cfset a='http://www.#application.dsn#/cms/#url.section#/#url.module#/viewalbum/?id=#url.g#'>
<cfif (CGI.HTTP_REFERER EQ r) OR (CGI.HTTP_REFERER) EQ a>
	<cfset allIsWell=TRUE>
</cfif>

<cfif allIsWell>
	<cftransaction>
		<cfloop list="#url.l#" index="vid">
			<cfinvoke component="#application.objvideolib#" method="removeVideoFromCategory" videodsn="#client.siteurl#" videocategoryid="#url.g#" vid="#vid#">
		</cfloop>
	</cftransaction>
	<cfinclude template="/actions/tracking.cfm">
</cfif>

<cflocation url="#CGI.HTTP_REFERER#" addtoken="false">