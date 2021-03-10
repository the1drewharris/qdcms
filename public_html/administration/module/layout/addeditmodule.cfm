<cfoutput>
	<h1>#action#</h1>
	<cfinclude template="/display/errors.cfm">
	<form name="frmadd" action="#formaction#" id="form" method="post">
		<input type="hidden" name="moduleid" value="#application.objtextconversion.setformValue('moduleid')#" />
		<table id="webPageEditorTable"  class="htmform" cellpadding="3">
		  	<tr>
				<td class="mainWebPageInfo">
					<fieldset>
						<label class="name">Module Name
				    		<input type="text" name="modulename" value="#application.objtextconversion.setformValue('modulename')#" />
						</label>
						
						<label class="name">Caption
				    		<input type="text" name="caption" value="#application.objtextconversion.setformValue('caption')#" />
						</label>
						
						<label class="name">Description
							<textarea name="description" cols="30" rows="10" >#application.objtextconversion.setformValue('description')#</textarea>
						</label>
						
						<div class="clear"></div>
					</fieldset>
				</td>
				
				<td class="quickWebPageInfo">
					<div class="container">
						<div class="header">Select Sections</div> <br />
						<cfinclude template="/administration/module/display/sectionlist.cfm">
					</div>
				</td>
		 	</tr>
		 	<tr>
		   		<td colspan="2" align="left">
					<input type="submit" name="Submit" value="Submit">
				</td>
		 	</tr>
		</table>
	</form>
</cfoutput>