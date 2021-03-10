<cfoutput>
	<h1>#title#</h1>
	<form action="/cms/content/webpages/#formaction#" method="post" enctype="multipart/form-data" id="form">
		<input type="hidden" name="templateid" value="#application.objtextconversion.setformvalue('templateid')#" />
		<table id="webPageEditorTable">
			<tr>
				<td class="mainWebPageInfo">
					<fieldset>
						<label class="name">Template Name<em>*</em>
							<input type="text" name="name" value="#application.objtextconversion.setformvalue('name')#"><br />
						</label>
						
						<label class="name">
							Description <em></em><span class="note">A few sentences about this template to help describe it.</span>
							<textarea name="description">#application.objtextconversion.setformvalue('description')#</textarea>
						</label>
						
						<label class="name">
							HTML Template <em>*</em><span class="note">Paste or type your HTML for your template.</span>
							<textarea name="template">#application.objtextconversion.setformvalue('template')#</textarea>
						</label>
						
						<label class="name">
							File<br />
							<input type="file" name="Filedata" size="65">
						<label>
					</fieldset>
				</td>
				<cfif url.action EQ 'editwptemplate'>
					<td class="quickWebPageInfo">
						<div class="container">
							<cfset tempimgpath=application.objtextconversion.setformvalue('imagepath')>
							<cfif tempimgpath NEQ ''>
								<img src="http://#client.siteurl#/images/#tempimgpath#" width="265"/>
							<cfelse>
								<b>Template Image Unavailabe</b>
							</cfif>
						</div>
					</td>
				</cfif>
			</tr>
		</table>
		<div class="clear"> </div>
		<input type="submit" value="Save" />
	</form>
</cfoutput>