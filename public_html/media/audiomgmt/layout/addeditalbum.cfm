<cfoutput>
	<h1>#title#</h1>
	<form action="/cms/#url.section#/#url.module#/#formaction#" id="form" method="post">
		<input type="hidden" name="videocategoryid" value="#application.objtextconversion.setFormValue('videocategoryid')#">
		<table id="webPageEditorTable"  class="htmform" cellpadding="3" >
		  	<tr>
				<td class="mainWebPageInfo">
					<fieldset>
						<label class="name">
							Album Name
				    		<input type="text" name="category" value="#application.objtextconversion.setformValue('category')#" />
						</label>
					</fieldset>
				</td>
				<td class="quickWebPageInfo">
					<div class="container">
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