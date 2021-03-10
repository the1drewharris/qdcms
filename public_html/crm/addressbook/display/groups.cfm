<cfoutput>
	<cfset selectedgroups=application.objtextconversion.setformvalue('groups')>
	<cfinvoke component="#Application.abCFC#" method="getGroupName" contactdsn="#client.siteurl#" returnVariable="groups" />
	<dl id="groupsDL" class="slider">
		<dt id="groupsDT">Groups</dt>
		<dd class="slideElement">
			<cfloop query="groups">
				<input type="checkbox" name="grouplist" value="#groupid#" <cfif listfindnocase(selectedgroups,groupid) GT 0>Checked</cfif>>#name#<br />
			</cfloop>
			<cfif url.action EQ 'advancedsearch'>
				<input type="checkbox" name="grouplist" value="-1">Not in any Group
			</cfif>
		</dd>
	</dl>
	<div class="clear"></div>
</cfoutput>