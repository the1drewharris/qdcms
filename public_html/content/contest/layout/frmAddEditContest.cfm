<cfoutput>
	<cfparam name="session.formValues.startdate" default="#DateFormat(Now(), 'mm/dd/yyyy')#">
	<cfparam name="session.formValues.enddate" default="#DateFormat(Now(), 'mm/dd/yyyy')#">
	
	<h1>#title#</h1>
	<form id="form" method="post" action="/cms/content/contest/#formaction#">
		<input type="hidden" name="contestid" value="#application.objtextconversion.setFormValue('contestid')#">
		<table id="webPageEditorTable">
			<tr>
				<td class="mainWebPageInfo">
					<fieldset>
						<label class="name">Name of the Contest
							<input type="text" name="description"  value="#application.objtextconversion.setFormValue('description')#">
						</label>
						<div class="clear"></div>
									
						<label class="name"> Contest Description
							<cfscript> 
								basePath = "/fckeditor/";
								fckEditor = createObject("component", "#basePath#fckeditor"); 
								fckEditor.instanceName  = "longdescription"; 
								fckEditor.ToolbarSet = "qdelta";
								fckEditor.config.SkinPath = "#basePath#skins/qdcms/";
								fckEditor.config.BrowserContextMenuOnCtrl = true ; 
								fckEditor.config.LinkBrowser = false;
								fckEditor.height = '350'; 
								fckEditor.config.TemplatesXmlPath =  '/content/webpages/actions/templateXML.cfm';
								fckEditor.value=application.objtextconversion.setFormValue('longdescription'); 
								fckEditor.config.ImageBrowserURL = '/media/imagemgmt/actions/imageBrowser.cfm' ;
								fckEditor.config.LinkUpload = false ; 
								fckEditor.config.ImageBrowser = true ; 
								fckEditor.config.ImageUpload = false ; 
								fckEditor.config.FlashBrowser = false ; 
								fckEditor.config.FlashUpload = false ;
								fckEditor.create(); // create the editor. 
							</cfscript> 
						</label> 
					
						<label class="name">Question
							<textarea name="question">#application.objtextconversion.setFormValue('question')#</textarea>
						</label>
						
						<div class="clear"></div>
					</fieldset>
				</td>
				<td class="quickWebPageInfo">
					<div class="container">
						<h4>Schedule</h4>
						<p id="starttime">
							Start on<br />
							<input id="startdate" name="startdate" value="#application.objtextconversion.setFormValue('startdate')#" type="text" />
							<cfset sh=application.objtextconversion.setFormValue('starthour')>
							<select name="starthour" rel="actual" id="starthour">
								<cfloop from="1" to="12" index="i">
									<cfif i LT 10>
										<cfset hours="0#i#">
									<cfelse>
										<cfset hours=i>
									</cfif>
									<option <cfif sh EQ hours>selected</cfif>>#hours#</option>
								</cfloop>	
							</select> 
							
							<cfset sm=application.objtextconversion.setFormValue('startminute')>
							<select name="startminute" rel="actual" id="startminute">
								<cfloop from="0" to="59" index="i">
									<cfif i LT 10>
										<cfset mins="0#i#">
									<cfelse>
										<cfset mins=i>
									</cfif>
									<option <cfif sm EQ mins>selected</cfif>>#mins#</option>
								</cfloop>	
							</select> 
							
							<cfset sap=application.objtextconversion.setFormValue('startampm')>
							<select name="startampm" rel="actual" id="startampm">
								<option <cfif sap EQ "AM">selected</cfif>>AM</option>
								<option <cfif sap EQ "PM">selected</cfif>>PM</option>
							</select><br />
						</p>
					
						<p id="endtime">
							End on<br />
							<input name="enddate" rel="actual" id="enddate" type="text" value="#application.objtextconversion.setformValue('enddate')#" />
							<cfset eh=application.objtextconversion.setformValue('endhour')>
							<select name="endhour" rel="actual" id="endhour">
								<cfloop from="1" to="12" index="i">
									<cfif i LT 10>
										<cfset hours="0#i#">
									<cfelse>
										<cfset hours=i>
									</cfif>
									<option <cfif eh EQ hours>selected</cfif>>#hours#</option>
								</cfloop>	
							</select> 
							
							<cfset em=application.objtextconversion.setFormValue('endminute')>
							<select name="endminute" rel="actual" id="endminute">
								<cfloop from="0" to="59" index="i">
									<cfif i LT 10>
										<cfset mins="0#i#">
									<cfelse>
										<cfset mins=i>
									</cfif>
									<option <cfif em EQ mins>selected</cfif>>#mins#</option>
								</cfloop>	
							</select> 
							
							<cfset eap=application.objtextconversion.setFormValue('endampm')>
							<select name="endampm" id="endampm" rel="actual">
								<option <cfif eap EQ "AM">selected</cfif>>AM</option>
								<option <cfif eap EQ "PM">selected</cfif>>PM</option>
							</select>
						</p>
						
						<div class="clear"></div>
						<h4>What is requied to participate in the contest?</h4>
						<input name="answerrequired" type="checkbox" value="1" <cfif application.objtextconversion.setFormValue('answerrequired') EQ 1>checked</cfif>/>Answer<br />
						<input name="imagerequired" type="checkbox" value="1" <cfif application.objtextconversion.setFormValue('imagerequired') EQ 1>checked</cfif>/>Image<br />
						<input name="videorequired" type="checkbox" value="1" <cfif application.objtextconversion.setFormValue('videorequired') EQ 1>checked</cfif>/>Video<br />
				
						<div class="clear"></div>
						<cfif title NEQ "View Contest">
							<input type="submit" name="submit" value="Submit" />
						</cfif>
					</div>
				</td>
			</tr>
		</table>
	</form>
</cfoutput>
