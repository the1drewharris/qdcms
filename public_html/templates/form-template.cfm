<cfoutput>
	<h1>#title#</h1>
	<form action="/cms/#url.section#/#url.module#/#formaction#" id="form" method="post">
		<input type="hidden" name="" value="#application.objtextconversion.setFormValue()#">
		<table id="webPageEditorTable"  class="htmform" cellpadding="3" >
		  	<tr>
				<td class="mainWebPageInfo">
					<fieldset>
						<label class="name">
							Name
				    		<input type="text" name="name" value="#application.objtextconversion.setformValue('name')#" />
						</label>
						
						<!--- For WYSIWYG
						<cfset descriptionEditor=Application.fckeditor>
						<cfset descriptionEditor.instanceName="description">
						<cfset descriptionEditor.value=Application.objtextconversion.setformvalue('description')>
						<label class="name">Description
							<cfset descriptionEditor.create()>
						</label> 
						--->
					
						<!--- For check box
						<cfset checkDisabledIf1="">
						<cfif application.objtextconversion.setformvalue('disabled') EQ 1>
							<cfset checkDisabledIf1="Checked">
						</cfif> 
						
						<input name="disabled" type="checkbox" value="1" #checkDisabledIf1#>Disabled
						--->
						
						<!--- for drop down box
						<cfset thiszone=application.objtextconversion.setformValue('zoneid')>
						<label class="name">Zone
							<select name="zoneid">
								<cfloop query="Zones">
									<option value="#zoneid#" <cfif thiszone EQ zoneid>SELECTED</cfif>>#description#</option>
								</cfloop>
							</select>
						</label> 
						--->
					</fieldset>
				</td>
				<td class="quickWebPageInfo"><!--- Right Column --->
					<div class="container">
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