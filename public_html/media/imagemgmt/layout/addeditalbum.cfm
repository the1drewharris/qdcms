<cfoutput>
	<cfinvoke component="#application.objimagegallery#" method="getQuickGalleriesInfo" imagedsn="#client.siteurl#" returnvariable="quickgalleryinfo">
	<cfset statuslist="Public,Private,Shared,Non-Active">
	<h1>#title#</h1>
	<form action="/cms/#url.section#/#url.module#/#formaction#" id="form" method="post">
		<input type="hidden" name="galleryid" value="#application.objtextconversion.setFormValue('galleryid')#">
		<table id="webPageEditorTable"  class="htmform" cellpadding="3" >
		  	<tr>
				<td class="mainWebPageInfo">
					<fieldset>
						<label class="name">Title
				    		<input type="text" name="galleryname" value="#application.objtextconversion.setformValue('galleryname')#" />
						</label>
						<label class="name">Status
							<cfset mystatus=application.objtextconversion.setformvalue('status')>
							<select name="status">
					    		<cfloop list="#statuslist#" index="status">
									<option value="#status#" <cfif mystatus EQ status>Selected</cfif>>#status#</option>
								</cfloop>
							</select>
						</label>
						<label class="name">Description
				    		<textarea name="gallerydescription">#application.objtextconversion.setformValue('gallerydescription')#</textarea>
						</label>
						<input type="submit" name="Submit" value="Submit" >
					</fieldset>
				</td>
				<td class="quickWebPageInfo">
					<div class="alt-container">
						<cfloop query="quickgalleryinfo">
							<cfif currentRow mod 2 EQ 0>
								<div class="alt-container-content">
									<a href="/cms/#url.section#/#url.module#/editalbum/?id=#imagecategoryid#">#imagecategory#</a><br />
								</div>
							<cfelse>
								<div class="alt-container-content-alt">
									<a href="/cms/#url.section#/#url.module#/editalbum/?id=#imagecategoryid#">#imagecategory#</a><br />
								</div>
							</cfif>
						</cfloop>
					</div>
				</td>
		 	</tr>
		</table>
	</form>
</cfoutput>