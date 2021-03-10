<cfoutput>
	<cfset thereAreErrors=FALSE>
	<cfif client.message NEQ "" OR client.errorList NEQ "">
		<cfset thereAreErrors=TRUE>
		<div class="quicknote">
			<cfif client.message NEQ "">
				<h1>#client.message#</h1>
			</cfif>
			<cfif client.errorList NEQ "">
				<ul>
					<cfloop list="#client.errorList#" index="error">
						<li>#error#</li>
					</cfloop>
				</ul>
			</cfif>
			<cfset client.message="">
			<cfset client.errorList="">
		</div>
		<div class="clear"></div> <br />
	</cfif>
</cfoutput>
