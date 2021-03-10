<cfparam name="url.c" default="0">
<cfif isNumeric(url.c)>
	<cfoutput>
		<cfinvoke component="#application.objproduct#" method="getelligibleparents" productdsn="#client.siteurl#" categoryid="#url.c#" returnvariable="elligibleParents">
		<h1>#title#</h1>
		<form action="/cms/#url.section#/#url.module#/#formaction#" id="form" method="post">
			<input type="hidden" name="categoryid" value="#application.objtextconversion.setFormValue('categoryid')#">
			<table id="webPageEditorTable"  class="htmform" cellpadding="3">
			  	<tr>
					<td class="mainWebPageInfo">
						<fieldset>
							<label class="name">Category Name
					    		<input type="text" name="category" value="#application.objtextconversion.setformValue('category')#" />
							</label>
							<cfset myparent=application.objtextconversion.setformvalue('parentid')>
							<label class="name">Parent Category
								<select name="parentid">
									<option value="0">No Parent</option>
									<cfloop query="elligibleParents">
										<option value="#categoryid#" <cfif myparent EQ categoryid>Selected</cfif>>
											<cfif NESTLEVEL GT 1>
												<cfloop from="2" to="#NESTLEVEL#" index="i">&mdash;</cfloop>
											</cfif>
											#category#
										</option>
									</cfloop>
								</select>
							</label>
						</fieldset>
					</td>
					<td class="quickWebPageInfo">
						<div class="container">
							<cfinclude template="../display/showcategories.cfm">
						</div>
					</td>
			 	</tr>
			 	<tr>
			   		<td colspan="2">
						<input type="submit" name="Submit" value="Submit" >
					</td>
			 	</tr>
			</table>
		</form>
	</cfoutput>
</cfif>