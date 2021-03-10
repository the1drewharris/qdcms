<cf_newTree treename="heardaboutusid" font="Arial" italic="No" multipleselect="yes">
	<cfoutput query="hauoptions">
		<cfif intheevent EQ "1">
			<cf_newTreeItem display="#ABOUTUS#" value="#ABOUTUSID#" selectable="true" parent="#ABOUTUSPARENTID#" />
		</cfif>
	</cfoutput>
</cf_newTree>