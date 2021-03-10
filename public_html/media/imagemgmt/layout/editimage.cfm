<cfoutput>
	<cfset client.editImageReturnPath=cgi.http_referer>
	<cfset statuslist="Active,Non-Active,Pending">
	<h1>#title#</h1>
	<form action="/cms/#url.section#/#url.module#/#formaction#" id="form" method="post">
		<cfset imgpath=application.objtextconversion.setFormValue('imagename')>
		<input type="hidden" name="imageid" value="#application.objtextconversion.setFormValue('imageid')#">
		<input type="hidden" name="imagename" value="#imgpath#">
		<table id="webPageEditorTable" class="htmform" cellpadding="3" >
		  	<tr>
				<td class="mainWebPageInfo">
					<fieldset>
						<label class="name">
							Title
				    		<input type="text" name="imagetitle" value="#application.objtextconversion.setformValue('imagetitle')#" />
						</label>
						<label class="name">
							Alt
				    		<input type="text" name="imagealt" value="#application.objtextconversion.setformValue('imagealt')#" />
						</label>
						<label class="name">
							Link
				    		<input type="text" name="link" value="#application.objtextconversion.setformValue('link')#" />
						</label>
						<cfset thisstatus=application.objtextconversion.setformValue('status')>
						<label class="name">Status
							<select name="status">
								<cfloop list="#statuslist#" index="s">
								<option value="#s#"<cfif s EQ thisstatus>Selected</cfif>>#s#</option>
								</cfloop>
							</select>
						</label>
						<label class="name">
							<textarea name="caption">#application.objtextconversion.setformValue('caption')#</textarea>
						</label>
					</fieldset>
				</td>
				<td class="quickWebPageInfo">
					<div class="container">
						<img src="#client.imagepath#/large/#imgpath#" width="265">
					</div>
				</td>
		 	</tr>
		 	<tr>
		   		<td colspan="2">
					<input type="submit" name="Submit" value="Update" >
				</td>
		 	</tr>
		</table>
	</form>
</cfoutput>