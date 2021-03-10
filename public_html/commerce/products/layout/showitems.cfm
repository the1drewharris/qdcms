<cfparam name="url.id" default="0">
<cfif isNumeric(url.id)>
	<cfinvoke component="#application.objproduct#" method="getItemNameFromId" productdsn="#client.siteurl#" id="#url.id#" returnvariable="ItemName">
	<cfinvoke component="#application.objproduct#" method="getGroupMembers" productdsn="#client.siteurl#" groupid="#url.id#" returnvariable="members">
	<cfoutput>
		<cfif members.recordcount GT 0>
			<h1 style="float:left">#itemName#</h1>
			<span class="right"><a href="/cms/#url.section#/#url.module#/additemtoproductgroup/?id=#url.id#">+ Add Item</a></span>
			<table class="datagrid" id="managePagesTable">
				<tr class="titlebar">
					<th>Member Name</th>
					<th>Description</th>
					<th>Attributes</th>
					<th></th>
				</tr>
				<cfloop query="members">
					<cfif currentRow MOD 2 EQ 0>
						<tr class="alt">
					<cfelse>
						<tr>
					</cfif>
					<td>#itemname#</td>
			  		<td>#description#</td>
					<td>#attributes#</td>
					<td><a href="/cms/#url.section#/#url.module#/actionremoveitem/?g=#url.id#&id=#id#">Remove</a></td>
					</tr>
				</cfloop>
			</table>
		<cfelse>
			<div class="quicknote">
				Some Message Here
			</div>
		</cfif>
	</cfoutput>
</cfif>