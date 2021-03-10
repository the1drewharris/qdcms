<cfset browsers=application.objincident.getBrowsers(thissite)>
<cfset oslist=application.objincident.getOS(thissite)>
<cfset categories=application.objincident.getcategories(thissite)>
<cfset screenresolutions="Lower than 800X600,800X600,1024X768,Higher than 1024X768">
<cfoutput>
	<h3>Please Provide as much information as possible</h3>
	<form id="form" enctype="multipart/form-data" action="/cms/taskmgmt/troubleticket/actionreportincident" method="post">
		<table id="webPageEditorTable">
			<tr>
				<td class="mainWebPageInfo">
					<fieldset>
						<cfset trouble_browser=application.objtextconversion.setformvalue('browserid')>
						<label class="name">
							Browser Type <em>*</em>
							<select name="browserid">
								<cfloop query="browsers">
								<option value="#browserid#" <cfif trouble_browser EQ browserid>Selected</cfif>>#browsername#</option>
								</cfloop>
							</select>
						</label>
						
						<cfset trouble_osid=application.objtextconversion.setformvalue('osid')>
						<label class="name">
							Operating System <em>*</em>
							<select name="osid">
								<cfloop query="oslist">
									<option value="#osid#" <cfif  trouble_osid EQ osid>Selected</cfif>>#osname#</option>
								</cfloop>
							</select>
						</label>
						
						<cfset trouble_incidentcategoryid=application.objtextconversion.setformvalue('incidentcategoryid')>
						<label class="name">
							Incident Category<em>*</em>
							<select name="incidentcategoryid">
								<cfloop query="categories">
									<option value="#incidentcategoryid#" <cfif trouble_incidentcategoryid EQ incidentcategoryid>Selected</cfif>>#incidentcategoryname#</option>
								</cfloop>
							</select>
						</label>
						
						<cfset trouble_screenres=application.objtextconversion.setformvalue('screenres')>
						<label class="name">
							Screen Resolution<em>*</em>
							<select name="screenres">
								<cfloop list="#screenresolutions#" index="screenresolution">
									<option value="#screenresolution#" <cfif screenresolution EQ trouble_screenres>Selected</cfif>>#screenresolution#</option>
								</cfloop>
							</select>
						</label>
						
						<label class="name">
							Incident URL<input type="textarea" name="incidenturl" value="#application.objtextconversion.setformvalue('incidenturl')#">
						</label>
						
						<label class="name">
							Incident Description <small>provide us with some details about the problem</small><em>*</em>
							<textarea name="incidentdescription">#application.objtextconversion.setformvalue('incidentdescription')#</textarea>
						</label>
						
						<label class="name">
							What were you doing when you experienced this problem?<em></em>
							<textarea name="incidentdoing">#application.objtextconversion.setformvalue('incidentdoing')#</textarea>
						</label>
						
						<label class="name">
							What did the error message say? <em></em>
							<textarea name="errordescription">#application.objtextconversion.setformvalue('errordescription')#</textarea>
						</label>
						
						<label class="name">
							Upload Screenshot <strong >JPG, JPEG, GIF, PNG images only</strong><small>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;would really appreciate if you include one</small>
							<input type="file" name="screenshot" size="65">
						</label>
					</fieldset>
					
					<input type="submit" name="submit" value="submit">
				</td>
			</tr>
		</table>
	</form>		
</cfoutput>