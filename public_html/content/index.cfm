<cfswitch expression="#url.module#">
	<cfcase value="blog">
		<cfinclude template="/content/blog/index.cfm">
	</cfcase>
	<cfcase value="contest">
		<cfinclude template="/content/contest/index.cfm">
	</cfcase>
	<cfcase value="forum">
		<cfinclude template="/content/forum/index.cfm">
	</cfcase>
	<cfcase value="links">
		<cfinclude template="/content/links/index.cfm">
	</cfcase>
	<cfcase value="navigation">
		<cfinclude template="/content/navigation/index.cfm">
	</cfcase>
	<cfcase value="survey">
		<cfinclude template="/content/survey/index.cfm">
	</cfcase>
	<cfcase value="webpages">
		<cfinclude template="/content/webpages/index.cfm">
	</cfcase>
	<cfdefaultcase>
		<cfinclude template="/content/layout/default.cfm">
	</cfdefaultcase>
</cfswitch>