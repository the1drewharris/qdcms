<cfoutput>
	<cfset allselected=1>
	<cfinvoke component="#Application.abCFC#" method="searchGroup" contactdsn="#client.siteurl#"  returnvariable="myGroups">
	<cfsavecontent variable="includegroupscontent">
		<input name="allgroups" type="checkbox" id='sel_all' value="all" /><b>Select All Groups</b><br /><br />
		<cfloop query="myGroups">
			<cfif Trim(myGroups.name) NEQ "do not email">
				<cfinvoke component="#application.objevent#" method="getEventsContainingGroup" eventdsn="#client.siteurl#" groupid="#groupid#" returnvariable="groupevents">
				<cfif application.objtextconversion.setFormValue('group#groupid#_0') EQ "#groupid#:0">
					<cfset groupstatus = 'Checked'>
				<cfelse>
					<cfset allselected = 0>
					<cfset groupstatus = ''>
				</cfif>
				<input name="group#groupid#_0" type="checkbox" class="sel_checkbox" value="#groupid#:0" #groupstatus# />#myGroups.name#<br />
				<cfif groupevents.recordcount GT 0>
					<div class="subitem-checkbox">
					<cfloop query="groupevents">
						<cfset groupstatus=''>
						<cfif application.objtextconversion.setFormValue('group#myGroups.groupid#_#eventid#') EQ '#myGroups.groupid#:#eventid#'>
							<cfset groupstatus='Checked'>
						</cfif>
						<input type="checkbox" name="group#myGroups.groupid#_#eventid#" class="not-all" value="#myGroups.groupid#:#eventid#" #groupstatus#>#eventname# <br />
					</cfloop>
					</div>
				</cfif>
			</cfif>
		</cfloop>
	</cfsavecontent>
	<cfsavecontent variable="excludegroupscontent">
		<cfloop query="myGroups">
			<cfif Trim(myGroups.name) EQ "do not email">
				<input name="donotinclude" DISABLED type="checkbox" value="0" CHECKED/>#myGroups.name#<br />
			<cfelse>
				<cfinvoke component="#application.objevent#" method="getEventsContainingGroup" eventdsn="#client.siteurl#" groupid="#groupid#" returnvariable="groupevents">
				<cfif application.objtextconversion.setFormValue('excludegroup#groupid#_0') EQ '#myGroups.groupid#:0'>
					<cfset groupstatus = 'Checked'>
				<cfelse>
					<cfset groupstatus= ''>
				</cfif>
				<input name="excludegroup#groupid#_0" type="checkbox" value="#groupid#" #groupstatus# />#myGroups.name#<br />
				<cfif groupevents.recordcount GT 0>
					<div class="subitem-checkbox">
					<cfloop query="groupevents">
						<cfset groupstatus=''>
						<cfif application.objtextconversion.setFormValue('excludegroup#myGroups.groupid#_#eventid#') EQ '#myGroups.groupid#:#eventid#'>
							<cfset groupstatus='Checked'>
						</cfif>
						<input type="checkbox" name="excludegroup#myGroups.groupid#_#eventid#" class="not-all" value="#myGroups.groupid#:#eventid#" #groupstatus#>#eventname# <br />
					</cfloop>
					</div>
				</cfif>
			</cfif>
		</cfloop>
	</cfsavecontent>
	<h1>#title#</h1>
	<form id="form" method="post" action="/cms/marketing/newsletter/#formaction#">
		<input type="hidden" name="newsletterid" value="#application.objtextconversion.setFormValue('newsletterid')#">
		<table id="webPageEditorTable">
			<tr>
				<td class="mainWebPageInfo">
					<fieldset>
						<label class="name">Reply To Email Address
							<input type="text" name="replyto" value="#application.objtextconversion.setFormValue('replyto')#">
						</label>
						<div class="clear"></div>
						
						<label class="name">Send From Name
							<input type="text" name="sendfromname" value="#application.objtextconversion.setFormValue('sendfromname')#">
						</label>
						<div class="clear"></div>
						
						<label class="name">Newsletter Name (to help you identify the newsletter later)
							<input type="text" name="name" value="#application.objtextconversion.setFormValue('name')#">
						</label>
						<div class="clear"></div>
						
						<label class="name">Subject
							<input type="text" name="subject" value="#application.objtextconversion.setFormValue('subject')#">
						</label>
						<div class="clear"></div>
									
						<label class="name"> HTML Newsletter
							<cfscript> 
								basePath = "/fckeditor/";
								fckEditor = createObject("component", "#basePath#fckeditor"); 
								fckEditor.instanceName  = "htmlnewsletter"; 
								fckEditor.ToolbarSet = "qdelta";
								fckEditor.config.SkinPath = "#basePath#skins/qdcms/";
								fckEditor.config.BrowserContextMenuOnCtrl = true ; 
								fckEditor.config.LinkBrowser = false;
								fckEditor.height = '350'; 
								fckEditor.config.TemplatesXmlPath =  '/marketing/newsletter/actions/templateXML.cfm';
								fckEditor.value="#application.objtextconversion.setFormValue('htmlnewsletter')#"; 
								fckEditor.config.ImageBrowserURL = '/media/imagemgmt/actions/imageBrowser.cfm' ;
								fckEditor.config.LinkUpload = false ; 
								fckEditor.config.ImageBrowser = true ; 
								fckEditor.config.ImageUpload = false ; 
								fckEditor.config.FlashBrowser = false ; 
								fckEditor.config.FlashUpload = false ;
								fckEditor.create(); // create the editor. 
							</cfscript> 
						</label> 
					
						<label class="name">Text Newsletter
							<textarea name="textnewsletter">#application.objtextconversion.setFormValue('textnewsletter')#</textarea>
						</label>
					</fieldset>
				</td>
			
				<td class="quickWebPageInfo">
					<div class="container">
						<div class="clear"></div>
						<input type="hidden" name="queueid" value="#application.objtextconversion.setFormValue('queueid')#">
						<p>
							<cfif title NEQ 'View Newsletter'>
								<input type="checkbox" value="1" name="sendnow" <cfif application.objtextconversion.setFormValue('sendnow') EQ 1>Checked</cfif> /> Send Now
								<input type="checkbox" value="1" name="testsend" <cfif application.objtextconversion.setFormValue('testsend') EQ 1>Checked</cfif> /> Test Send (<small>Send to me</small>)
								<br /><br />
							</cfif>
							<cfif title EQ 'View Newsletter'>
								<b>Newsletter sent on</b>
							<cfelse>
								<b>Schedule to send on</b>
							</cfif>
							<div class="clear"></div>
							<input id="senddate" name="senddate" value="#application.objtextconversion.setFormValue('senddate')#" rel="actual" type="text" />
							<cfset sendhr=application.objtextconversion.setFormValue('sendhour')>
							<cfset sendmin=application.objtextconversion.setFormValue('sendmin')>
							<cfset sendap=application.objtextconversion.setFormValue('sendampm')>
							<select name="sendhour" rel="actual" id="sendhour">
								<cfloop from="1" to="12" index="i">
									<cfif i LT 10><cfset hours="0#i#"><cfelse><cfset hours=i></cfif>
									<option <cfif sendhr EQ hours>selected</cfif>>#hours#</option>
								</cfloop>
							</select>
							<select name="sendmin" rel="actual" id="sendminute">
							<cfloop from="0" to="59" index="i">
								<cfif i LT 10><cfset mins="0#i#"><cfelse><cfset mins=i></cfif>
								<option <cfif sendmin EQ mins>selected</cfif>>#mins#</option>
							</cfloop>
							</select>
							<select name="sendampm" rel="actual" id="sendampm">
								<cfloop list="AM,PM" index="i">
									<option <cfif sendap EQ i>selected</cfif>>#i#</option>
								</cfloop>
							</select>
						</p>
						<h4>Choose Types of emails to send to</h4>
						<input name="hemail" type="checkbox" value="hemail" <cfif application.objtextconversion.setFormValue('hemail') EQ 'hemail'>checked</cfif> />Home<br />
						<input name="wemail" type="checkbox" value="wemail" <cfif application.objtextconversion.setFormValue('wemail') EQ 'wemail'>checked</cfif> />Work<br />
						<input name="memail" type="checkbox" value="memail" <cfif application.objtextconversion.setFormValue('memail') EQ 'memail'>checked</cfif> />Mobile<br />
						<input name="oemail" type="checkbox" value="oemail" <cfif application.objtextconversion.setFormValue('oemail') EQ 'oemail'>checked</cfif> />Other<br />
						<br />
						<div class="includeGroups">
							<dl id="includeGroups" class="slider">
								<dt>Include Groups</dt>
								<dd class="slideElement">
									#includegroupscontent#
									<br />
								</dd>
							</dl>
						</div>
						<br />
						<div style="clear:both;"></div>
					
						<div class="excludeGroups">
							<dl id="excludeGroupsDL" class="slider">
								<dt id="excludeGroupsDT">Exclude Groups</dt>
								<dd class="slideElement">
									#excludegroupscontent#
									<br />
								</dd>
							</dl>
						</div>
					
						<div class="clear"></div>
						<cfif title NEQ "View Newsletter">
							<input name="Submit" type="submit" value="Submit" />
						</cfif>
					</div>
				</td>
			</tr>
		</table>
	</form>
</cfoutput>