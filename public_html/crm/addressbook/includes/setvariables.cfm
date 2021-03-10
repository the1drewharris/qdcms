<cfif StructIsEmpty(form)>
	<cfset refererRegex=ArrayNew(1)>
	<cfset refererRegex[1]='http://[www.]?#application.dsn#/cms/#url.section#/#url.module#/actioneditcontact'>
	<cfset refererRegex[2]='http://[www.]?#application.dsn#/cms/#url.section#/#url.module#/actionaddnotes'>
	<cfset refererRegex[3]='http://[www.]?#application.dsn#/cms/#url.section#/#url.module#/actioneventgroups'>
	<!--- <cfset refererRegex[index]='http://[www.]?#application.dsn#/cms/#url.section#/#url.module#/action'> --->
	<cfset n=ArrayLen(refererRegex)>
	<cfloop from="1" to="#n#" index="i">
		<cfset result=ReMatch(refererRegex[i],CGI.HTTP_REFERER)>
		<cfif ArrayLen(result) GT 0>
			<cfset form=Session.form>
			<cfbreak>
		</cfif>
	</cfloop>
<cfelse>
	<cfset Session.form=form>
</cfif>