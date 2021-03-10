<cfinvoke component="#application.objevent#" method="getCategories" eventdsn="#client.siteurl#" returnVariable="categories">
<cfoutput>
	<h1>#title#</h1>
	<form id="form" action="/cms/crm/events/#formaction#" method="post">
		<input type="hidden" name="eventcategoryid" value="#application.objtextconversion.setformvalue('eventcategoryid')#">
		<table id="webPageEditorTable">
			<tr>
				<td class="mainWebPageInfo">
					<fieldset>
						<label class="name">
							Name of the Category
							<input type="text" name="eventcategory" value="#application.objtextconversion.setformvalue('eventcategory')#">
						</label>
						<div class="clear"></div>
						<label class="name">
							<cfset thisstatus=application.objtextconversion.setformvalue('status')>
				    		<select name="status">
								<option value="Public" <cfif thisstatus EQ "Public">Selected</cfif>>Public</option>
								<option value="Private" <cfif thisstatus EQ "Private">Selected</cfif>>Private</option>
								<option value="Inactive" <cfif thisstatus EQ "Inactive">Selected</cfif>>Inactive</option>
							</select>
						</label>
						<div class="clear"></div>
						<label class="name">
							Description
							<textarea name="description" cols="30" rows="10" >#application.objtextconversion.setformvalue('description')#</textarea>
							<div class="clear"></div>
						</label>
						<input type="submit" name="submit" value="Submit">
					</fieldset>
				</td>
				<td class="quickWebPageInfo">
					<div class="alt-container">
						<cfloop query="categories">
							<cfif currentRow mod 2 EQ 0>
								<div class="alt-container-content-alt">
									<a href="/cms/crm/events/editeventcategory?eventcategoryid=#eventcategoryid#">#eventcategory#</a>
								</div>
							<cfelse>
								<div class="alt-container-content">
									<a href="/cms/crm/events/editeventcategory?eventcategoryid=#eventcategoryid#">#eventcategory#</a>
								</div>
							</cfif>
						</cfloop>
					</div>
				</td>
			</tr>
		</table>
	</form>
</cfoutput>