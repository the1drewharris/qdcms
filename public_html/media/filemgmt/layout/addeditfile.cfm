<cfoutput>
	<h1>#title#</h1>
	<form id="form" method="post" action="/cms/media/filemgmt/#formaction#" enctype="multipart/form-data">
		<input type="hidden" name="fileid" value="#application.objtextconversion.setformvalue('fileid')#" />
		<table id="webPageEditorTable">
			<tr>
				<td class="mainWebPageInfo">
					<fieldset>
						<label class="name">Display Name
							<input type="text" name="displayname" value="#application.objtextconversion.setformvalue('displayname')#">
						</label>
						<label class="name">File
							<input type="file" name="file" size="60">
						</label>
						<label class="name">Sort Order
							<input type="text" name="sortorder" value="#application.objtextconversion.setformvalue('sortorder')#">
						</label>
					</fieldset>
					<input type="submit" name="submit" value="Submit">
				</td>
			</tr>
		</table>
	</form>
</cfoutput>