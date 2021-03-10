<cfparam name="url.id" default="0">
<cfset allisgood=TRUE>
<cfif IsNumeric(url.id)>
	<cfinvoke component="#application.objproduct#" method="getItemNameFromId" productdsn="#client.siteurl#" id="#url.id#" returnvariable="ItemName">
	<cfinvoke component="#application.objproduct#" method="getItemsNotInGroup" productdsn="#client.siteurl#" groupid="#url.id#" returnvariable="others">
	<cfif others.recordcount GT 0>
		<cfoutput>
			<h1>Add Item to <i>#itemname#</i></h1>
			<form action="/cms/#url.section#/#url.module#/#formaction#" id="form" method="post">
				<input type="hidden" name="groupid" value="#url.id#">
				<table id="webPageEditorTable"  class="htmform" cellpadding="3" >
				  	<tr>
						<td class="mainWebPageInfo">
							<fieldset>
								<label class="name">Select an Item to Add
									<select name="productid">
										<option value="">Select One...</option>
										<cfloop query="others">
											<option value="#id#">#itemname#</option>
										</cfloop>
									</select>
								</label>
							</fieldset>
						</td>
						<td class="quickWebPageInfo">
							<div class="container">
								<cfinclude template="../display/groupmembers.cfm">
							</div>
						</td>
				 	</tr>
				 	<tr>
				   		<td colspan="2">
							<input type="submit" name="Submit" value="Add Item">
						</td>
				 	</tr>
				</table>
			</form>
		</cfoutput>
	<cfelse>
		<cfset allisgood=FALSE>
	</cfif>
<cfelse>
	<cfset allisgood=FALSE>
</cfif>

<cfif NOT allisgood>
	<cflocation url="/cms/#url.section#/#url.module#/showproductgroups" addtoken="false">
</cfif>