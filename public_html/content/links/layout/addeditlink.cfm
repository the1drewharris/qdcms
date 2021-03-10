<cfoutput>
	<h1>#title#</h1>
	<form id="form" action="/cms/content/links/#formaction#" method="post">
		<input type="hidden" name="linkid" value="#application.objtextconversion.setformvalue('linkid')#">
		<table id="webPageEditorTable">
			<tr>
				<td class="mainWebPageInfo">
					<fieldset>
						<div class="clear"></div>
						<label class="name">
							Link Name<em>*</em><input type="textbox" name="name" value="#application.objtextconversion.setformvalue('name')#" /><br />
						</label>
						<label class="name">
							HREF (URL)<em>*</em><input type="Textbox" name="href" value="#application.objtextconversion.setformvalue('href')#" /><br />
						</label>
						<label class="name">
							Title<em></em><input type="Textbox" name="title" value="#application.objtextconversion.setformvalue('title')#" />
						</label>
						<cfset target=application.objtextconversion.setformvalue('status')>
						<label class="name">
							Target<em>*</em>
							<select name="target">
								<option value="_self" <cfif target EQ "_self">Selected</cfif>>Same Window</option>
								<option value="_blank" <cfif target EQ "_blank">Selected</cfif>>Open in New Window</option>
								<option value="_parent" <cfif target EQ "_parent">Selected</cfif>>Open in Parent Window</option>
							</select>
						</label> <br />
						<input type="submit" name="submit" value="submit">
					</fieldset>
				</td>
				<cfinvoke component="#application.objlinks#" method="getLinks" ds="#client.siteurl#" returnvariable="siteLinks">
				<cfif siteLinks.recordcount GT 0>
				<td class="quickWebPageInfo">
					<div class="alt-container">
						<cfloop query="siteLinks">
							<cfif currentRow mod 2 EQ 0>
								<div class="alt-container-content-alt">
									<a href="/cms/content/links/editlink/?linkid=#linkid#">#name#</a>
								</div>
							<cfelse>
								<div class="alt-container-content">
									<a href="/cms/content/links/editlink/?linkid=#linkid#">#name#</a>
								</div>
							</cfif>	
						</cfloop>
					</div>
				</td>
				</cfif>
			</tr>
		</table>
	</form>
</cfoutput>