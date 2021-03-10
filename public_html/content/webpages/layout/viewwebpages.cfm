<cfoutput>
	<cfinvoke component="#application.objwebpage#" method="getWebPageHeaders" webdsn="#client.siteurl#" returnVariable="webPageheaders">
	<cfif webPageheaders.recordcount EQ 0>
		<cfinclude template="../display/seeifthereareoldpages.cfm">
	<cfelse>
		<h1 style="float: left;">Web Pages</h1>
		<span style="float: left; margin: 10px 0 0 10px">
			<a href="" id="copy" title="Copy checked Web Pages">Copy</a>
			<a href="" id="delete" title="Delete checked Web Pages">Deactivate</a>
			<a href="" id="truedelete" title="Physically delete checked Web Pages">Delete</a>
		</span>
		<div class="clear"> </div>
		<table class="datagrid" id="managePagesTable">
			<tr class="titlebar">
				<th class="checkbox"><input id="selectAll" type="checkbox" /></th>
				<th>Name</th>
				<th>Status</th>
				<th>Date</th>
				<th></th>
			</tr>
			<cfloop query="webPageheaders">
				<cfif currentRow MOD 2 EQ 0>
					<cfif wpstatus EQ 'Deactive'>
						<tr class="alt-deleted">
					<cfelse>
						<tr class="alt">
					</cfif>
				<cfelse>
					<cfif wpstatus EQ 'Deactive'>
						<tr class="deleted">
					<cfelse>
						<tr>
					</cfif>
				</cfif>
				<td><input type="checkbox" id="wp#wpid#" /></td>
				<td>
					<a href="/cms/content/webpages/editwebpage/?w=#wpid#" class="name">
						<!--- <cfloop from="1" to="#nestLevel#" index="i">&##8212;</cfloop> --->
						#name#
					</a>
				</td>
				<td><a href="">#wpstatus#</a></td>
				<td>#application.objtimedateconversion.convertDate(createdon, "mm/dd/yyyy")#</td>
				<td><cfif wpstatus EQ 'Deactive'><a href="/cms/content/webpages/restore/?w=#wpid#">Restore</a></cfif></td>
				</tr>
			</cfloop>
		</table>
	</cfif>
</cfoutput>