<cfset refererRegex='http://[www.]?#application.dsn#/cms/#url.section#/#url.module#/actionupdateuserprofile'>
<cfset result=ReMatch(refererRegex,CGI.HTTP_REFERER)>
<cfdump var="#refererRegex#">
<cfdump var="#CGI.http_referer#">
<cfif ArrayLen(result) GT 0>
	<h1>
		Your profile has been updated. For some changes to take effect you need to <a href="/cms/logout">log out</a> for the changes to take effect.
	</h1>
<cfelse>
	<cflocation url="/cms" addtoken="false">
</cfif>