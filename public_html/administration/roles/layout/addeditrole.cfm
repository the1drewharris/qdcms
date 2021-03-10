<cfoutput>
	<cfinclude template="/display/errors.cfm">
	<h1>#action#</h1>
	<form name="frmadd" action="#formaction#" id="form" method="post">
		<input type="hidden" name="roleid" value="#application.objtextconversion.setformValue('roleid')#" />
		<table id="webPageEditorTable"  class="htmform" cellpadding="3">
		  	<tr>
				<td class="mainWebPageInfo">
					<fieldset>
						<label class="name">
							Security Role
				    		<input type="text" name="securityrole" value="#application.objtextconversion.setformValue('securityrole')#" />
						</label>
						
						<div class="clear"></div>
						
						<label class="name">
							Description<em></em><span class="note"></span>
							<textarea name="description" cols="30" rows="10" >#application.objtextconversion.setformValue('description')#</textarea>
						</label>
						
						<div class="clear"></div>
					</fieldset>
				</td>
				
				<td class="quickWebPageInfo">
					<div class="container">
						<div class="header">Select Modules</div> <br />
						<cfinclude template="../display/modulelist.cfm">
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
