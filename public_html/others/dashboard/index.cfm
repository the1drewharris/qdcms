<cfoutput>
	<cfswitch expression="#url.action#">
		<cfdefaultcase>
			<cfinclude template="/others/dashboard/layout/default.cfm">
		</cfdefaultcase>
	</cfswitch>
</cfoutput>