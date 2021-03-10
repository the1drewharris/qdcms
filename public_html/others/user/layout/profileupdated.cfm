<cfset refererRegex='http://[www.]?#application.dsn#/cms/#url.section#/#url.module#/profile'>
<cfset result=ReMatch(refererRegex,CGI.HTTP_REFERER)>
<cfif ArrayLen(result) GT 0>
	<h1>
		Your profile has been updated. For some changes to take effect you need to <a href="/cms/logout">log out</a> for the changes to take effect.
	</h1>
<cfelse>
	<cflocation url="/" addtoken="false">
</cfif>