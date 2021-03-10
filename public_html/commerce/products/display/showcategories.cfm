<cfoutput>
<cfinvoke component="#application.objproduct#" method="getcategory" productdsn="#client.siteurl#" returnvariable="categories">
<table class="datagrid" id="managePagesTable">
	<cfloop query="categories">
		<cfif currentRow MOD 2 EQ 0>
			<tr class="alt">
		<cfelse>
			<tr>
		</cfif>
		<td>
			<a href="/cms/#url.section#/#url.module#/editcategory/?c=#categoryid#" class="name">
				<cfloop from="2" to="#NESTLEVEL#" index="i">&mdash;</cfloop>
				#category#
			</a>
		</td>
		</tr>
	</cfloop>
</table>
</cfoutput>