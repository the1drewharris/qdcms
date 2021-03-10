<cfoutput>
	<cfloop query="session.sites">
		<cfset selected=FALSE>
		<cfif roleid GTE 4>
			<cfif application.objtextconversion.setformValue('siteid#siteid#') EQ siteid>
				<cfset selected=TRUE>
			</cfif>
		</cfif>
		<cfif roleid GTE 4>
			<input type="checkbox" name="siteid#siteid#" value="#siteid#" <cfif selected>Checked</cfif>>#siteurl# <br />
		</cfif>
	</cfloop>
</cfoutput>