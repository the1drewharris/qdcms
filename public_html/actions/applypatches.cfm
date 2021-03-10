<cfoutput>
	<cfset patchesToApply=application.objpatch.getPatchesToApply(client.siteid)>
	<cfif patchesToApply.recordcount GT 0>
		<cfloop query="patchesToApply">
			<cfinclude template="/administration/patches/patchfiles/#filename#">
			<cfif upgradeWasSuccessful>
				<cfset application.objpatch.setPatchAsApplied(patchid,client.siteid)>
			</cfif>
		</cfloop>
	</cfif>
</cfoutput> 