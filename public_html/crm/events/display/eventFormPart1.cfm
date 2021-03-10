<cfoutput>
<fieldset>
	<label class="name">Event Name<em>*</em>
		<input type="text" name="eventname" value="#application.objtextconversion.setFormValue('eventname')#"><br />
	</label>
	
	<label class="name">Event Category<em>*</em>
		<select name="eventcategoryid">
			<cfset value = application.objtextconversion.setFormValue('eventcategoryid')>
			<cfloop query="categories">
				<option value="#eventcategoryid#" <cfif value EQ eventcategoryid> Selected </cfif>>#eventcategory#</option>
			</cfloop>
		</select>
	</label>
	
	<label class="name">Event Status<em>*</em><small>&nbsp;&nbsp;&nbsp;&nbsp;Only event with public status will be published</small>
		<select name="status">Status
			<cfset value=application.objtextconversion.setFormValue('status')>
			<cfloop list="#statusList#" index="status">
				<option value="#status#" <cfif value EQ status>Selected</cfif>>#status#</option>
			</cfloop>
		</select>
	</label>
	<div class="clear"></div>
	
	<div class="single-line">
		<div class="column">
			<cfset selected=FALSE>
			<cfif application.objtextconversion.setFormValue('allday') EQ 1>
				<cfset selected=TRUE>
			</cfif>
			<input style="display:inline;align:left" type="checkbox" name="allday" value="1" <cfif selected>Checked</cfif>> <font size="2">All Day Event</font>
		</div>
	
		<div class="column">
			<font size="2">Date</font> <input type="text" id="alldaydate" name="alldaydate" value="#application.objtextconversion.setFormValue('alldaydate')#">
		</div>
	</div>
	<div class="clear"></div>
	
	<div class="single-line">
		<div class="justLabel"><b>OR</b></div>
	</div>
	<div class="clear"></div>
	
	<div class="single-line">
		<div class="justLabel">Start Time</div>
		<input type="text" id="startdate" name="startdate"  value="#application.objtextconversion.setFormValue('startdate')#">
		
		<select name="starthour">
			<cfset value=application.objtextconversion.setFormValue('starthour')>
			<cfloop list="#hourList#" index="hour">
				<option value="#hour#" <cfif value EQ hour>Selected</cfif>>#hour#</option>
			</cfloop>
		</select>
		
		<select name="startminute">
			<cfset value=application.objtextconversion.setFormValue('startminute')>
			<cfloop from="0" to="59" index="min">
				<cfif min LT 10>
					<cfset startmin="0#min#">
				<cfelse>
					<cfset startmin=min>
				</cfif>
				<option value="#startmin#" <cfif value EQ startmin>Selected</cfif>>#startmin#</option>
			</cfloop>
		</select>
		
		<select name="startampm">
			<cfset value=application.objtextconversion.setFormValue('startampm')>
			<cfloop list="#ttList#" index="ampm">
				<option <cfif value EQ ampm> selected</cfif>>#ampm#</option>
			</cfloop>
		</select>
	</div>
	<div class="clear"></div>
	
	<div class="single-line">
		<div class="justLabel">End Time</div>
		<input type="text" type="text" id="enddate" name="enddate"  value="#application.objtextconversion.setFormValue('enddate')#">
		<select name="endhour">
			<cfset value=application.objtextconversion.setFormValue('endhour')>
			<cfloop list="#hourList#" index="hour">
				<option value="#hour#" <cfif value EQ hour>selected</cfif>>#hour#</option>
			</cfloop>
		</select>
		
		<select name="endminute">
			<cfset value=application.objtextconversion.setFormValue('endminute')>
			<cfloop from="0" to="59" index="min">
				<cfif min LT 10>
					<cfset endmin="0#min#">
				<cfelse>
					<cfset endmin=min>
				</cfif>
				<option value="#endmin#" <cfif value EQ endmin>Selected</cfif>>#endmin#</option>
			</cfloop>
		</select>
		
		<select name="endampm">
			<cfset value=application.objtextconversion.setFormValue('endampm')>
			<cfloop list="#ttList#" index="ampm">
				<option <cfif value EQ ampm> selected</cfif>>#ampm#</option>
			</cfloop>
		</select>
	</div>
	<div class="clear"></div>
	
	<div class="single-line">
		<div class="multi-column1">
			<label class="repeat">Repeat<em>*</em><br />
				<select name="repeat" id="repeat">
					<cfset value=application.objtextconversion.setFormValue('repeat')>
					<cfloop list="#repeatList#" index="repeat">
						<option value="#repeat#" <cfif value EQ repeat>selected</cfif>>#repeat#</option>
					</cfloop>
				</select>
			</label>
		</div>
		
		<div class="multi-column4" id="nooftimes">
			<label class="repeat">No of Times <br />
				<input name="repeatAfter" id="repeat-after" value="#application.objtextconversion.setFormValue('repeatAfter')#">
			</label>
		</div>
		
		<div class="multi-column3" id="orcontainer">
			<b>OR</b>
		</div>
		
		<div class="multi-column2" id="repeatenddate">
			<div class="justLabel">Repeat End Date</div>
			<input name="repeatDate" id="repeatDate" value="#application.objtextconversion.setFormValue('repeatDate')#">
		</div>
	</div>
	<div class="clear"></div>
	
	<label class="name">Web Address
		<input type="text" name="eventurl" value="#application.objtextconversion.setFormValue('eventurl')#">
	</label>
	
	<label class="name">Description
		<cfscript> 
			basePath = "/fckeditor/";
			fckEditor = createObject("component", "#basePath#fckeditor"); 
			fckEditor.instanceName  = "description"; 
			fckEditor.ToolbarSet = "qdelta";
			fckEditor.config.SkinPath = "#basePath#skins/qdcms/";
			fckEditor.config.BrowserContextMenuOnCtrl = true; 
			fckEditor.config.LinkBrowser = false;
			fckEditor.height = '350'; 
			fckEditor.config.TemplatesXmlPath =  '/content/webpages/actions/templateXML.cfm';
			fckEditor.value = application.objtextconversion.setFormValue('description'); 
			fckEditor.config.ImageBrowserURL = '/media/imagemgmt/actions/imageBrowser.cfm';
			fckEditor.config.LinkUpload = false ; 
			fckEditor.config.ImageBrowser = true ; 
			fckEditor.config.ImageUpload = false ; 
			fckEditor.config.FlashBrowser = false ; 
			fckEditor.config.FlashUpload = false ;
			fckEditor.create(); // create the editor. 
		</cfscript> 
	</label> 
</fieldset>
<div class="clear"></div>
</cfoutput>