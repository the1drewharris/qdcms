<cfinvoke component="#application.objhau#" method="getHauOptions" haudsn="#client.siteurl#" returnvariable="hauoptions">
<cfoutput>
	<table class="datagrid" id="managePagesTable">
		<tr class="titlebar">
			<th>HAU Option</th>
			<th>Status</th>
			<th></th>
		</tr>
		<cfloop query="hauoptions">
			<cfif currentRow MOD 2 EQ 0>
				<tr class="alt">
			<cfelse>
				<tr>
			</cfif>
			<td>
				<cfif NESTLEVEL GT 0><cfloop from="1" to="#NESTLEVEL#" index="i"> &mdash;</cfloop></cfif><a href="/cms/marketing/heardaboutus/edithauoption/?h=#aboutusid#" class="name">#aboutus#</a>			
			</td>
	  		<td>#status#</td>
	  		<td><a href="/cms/marketing/heardaboutus/deletehauoption/?h=#aboutusid#">Delete</a></td>
		</cfloop>
	</table>
</cfoutput>