<cfinvoke component="#application.objnavigation#" method="getSimpleNavigations" ds="#client.siteurl#" returnVariable="navigations"/>

<cfif navigations.recordCount GTE 1>
	<table class="datagrid" id="managePagesTable">
		<tr class="titlebar">
			<th>Title</th>
			<!--- <th>Author</th> --->
			<th>Date</th>
			<th> </th>
		</tr>
		<cfoutput query="navigations" group="navid">
		<cfif currentRow MOD 2 EQ 0>
			<cfif status EQ 0>
				<tr class="alt-deleted">
			<cfelse>
				<tr class="alt">
			</cfif>
		<cfelse>
			<cfif status EQ 0>
				<tr class="deleted">
			<cfelse>
				<tr>
			</cfif>
		</cfif>
			<td><a href="/cms/content/navigation/editnavigation/?navid=#navid#" class="name" title="Edit &quot;#navname#&quot;"> 
			<cfif len(navname)>#navname#<cfelse><em>No Title</em></cfif>
			</a></td>
			<!--- <td>#firstname# #lastname#</td> --->
			<td>#application.objtimedateconversion.convertDate(navverid, "yyyy-mm-dd")#</td>
			<td>
				<cfif status EQ 0>
					<a href="/cms/content/navigation/restorenavigation/?navid=#navid#">Restore</a>
				<cfelse>
					<a href="/cms/content/navigation/deactivatenavigation/?navid=#navid#">Deactivate</a>
				</cfif>
				</td>
		</tr>
		</cfoutput>
	</table>
<cfelse>
	<div class="quicknote">
		<h1>There are currently no navigations for this site. 
		<a href="/cms/content/navigation/addNavigation">Click here</a> to add your first navigation!</h1>
		<p>It is really easy, plus every site needs at least one navigation!</p>
	</div>	
</cfif>