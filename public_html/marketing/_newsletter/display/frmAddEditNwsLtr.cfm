<script type="text/javascript" src="/js/formSlider.js"></script>

<script type="text/javascript">	
	 window.addEvent('domready', function() 
	 { 
	 	myCal = new Calendar({ senddate: { senddate: 'm/d/Y'}}, { pad: 0 });
	 	var includeGroups = new formSlider('includeGroups', {duration: 600, titleEl: 'dt', defaultState: 'hide'});
	 	var excludeGroups = new formSlider('excludeGroupsDL', {useTitleEl: 'no', defaultState: 'hide'});
		excludeGroups.toggleSlide('excludeGroupsDT');
		
		$('sel_all').addEvent('click', function()
		{
			if($('sel_all').get('checked')==true)
			{
				$$('.sel_checkbox').set('checked', true);
				$$('.not_selall_checkbox').set('checked',false);
			}
			else
			{
				$$('.sel_checkbox').set('checked',false);
				$$('.not_selall_checkbox').set('checked',false);
			}
		});
	 });
	 
	 function check_select_all(value)
	 {
	 	if(value==1) document.getElementById('sel_all').checked=true;
	 	
	 }
</script>
<cfoutput>

<!--- Display error message when there is error --->
<cfif listlen(client.validation) NEQ 0>
	<div class="quicknote">
		<h1>The Newsletter has errors.</h1>
		<ul>
		<cfloop list="#client.validation#" index="e">
			<li>#e#</li>
		</cfloop>
		</ul>
	</div>
</cfif>
<cfparam name="url.newsletterid" default="0">
<cfif url.newsletterid NEQ 0>
<cfinvoke component="#application.objnewsletter#" method="getSentNewsletter" ds="#client.siteurl#" newsletterid="#url.newsletterid#" returnvariable="isSent">
</cfif>

<cfif url.action eq "addnewsletter">
	<h1>Add Newsletter</h1>
<cfelse>
	<cfif isSent.recordcount EQ 0>
	<h1>Edit Newsletter</h1>
	<cfelse>
	<h1>View Newsletter</h1>
	</cfif>
</cfif>
<cfinvoke component="#Application.abCFC#" method="searchGroup" contactdsn="#client.siteurl#"  returnvariable="myGroups">

<form id="form" method="post" action="#formaction#">
<input type="hidden" name="newsletterid" value="#url.newsletterid#">
<table id="webPageEditorTable">
	<tr>
	<td class="mainWebPageInfo">
		<fieldset>
		<label class="name">Reply To Email Address
			<input type="text" name="replyto" value="#myNewsLetter.replyto#">
		</label>
		<div class="clear"></div>
		
		<label class="name">Send From Name
			<input type="text" name="sendfromname" value="#myNewsLetter.sendfromname#">
		</label>
		<div class="clear"></div>
		
		<label class="name">Newsletter Name (to help you identify the newsletter later)
			<input type="text" name="name" value="#myNewsLetter.name#">
		</label>
		<div class="clear"></div>
		
		<label class="name">Subject
			<input type="text" name="subject" value="#myNewsLetter.subject#">
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
			fckEditor.value='#myNewsLetter.htmlnewsletter#'; 
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
			<textarea name="textnewsletter">#myNewsLetter.textnewsletter#</textarea>
		</label>
		</fieldset>
	</td>

	<td class="quickWebPageInfo">
		<div class="container">
		<div class="clear"></div>
			<input type="hidden" name="queueid" value="#myNewsLetter.queueid#">
			<p>
				<input type="checkbox" name="sendnow" <cfif myNewsLetter.sendnow EQ 1>Checked</cfif>> Send Now
				<input type="checkbox" name="testsend"> Test Send (<font size="1"><i>Send to me</i></font>)
				<h4>Schedule to send on</h4>
				<div>
					<p id="starttime">
						<input id="senddate" name="senddate" value="#myNewsLetter.senddate#" rel="actual" type="text" />
						<select name="sendhour" rel="actual" id="sendhour">
						<cfloop from="1" to="12" index="i">
							<cfif i LT 10><cfset hours="0#i#"><cfelse><cfset hours=i></cfif>
							<option <cfif myNewsLetter.sendhour EQ hours>selected</cfif>>#hours#</option>
						</cfloop>
						</select>
						<select name="sendmin" rel="actual" id="sendminute">
						<cfloop from="0" to="59" index="i">
							<cfif i LT 10><cfset mins="0#i#"><cfelse><cfset mins=i></cfif>
							<option <cfif myNewsLetter.sendmin EQ mins>selected</cfif>>#mins#</option>
						</cfloop>
						</select>
						<!--- <input type="text" name="sendmin" size="2" value="#sendmin#" class="minutes" rel="actual" id="sendminute" /> --->
						<select name="sendampm" rel="actual" id="sendampm">
						<cfloop list="AM,PM" index="i">
							<option <cfif myNewsLetter.sendampm EQ i>selected</cfif>>#i#</option>
						</cfloop>
						</select>
					</p>
				</div>
			</p>
		<h4>Choose Types of emails to send to</h4>
		<input name="hemail" type="checkbox" value="hemail" <cfif listContainsNoCase(myNewsLetter.emailtypes,"hemail") NEQ 0>checked</cfif> />Home<br />
		<input name="wemail" type="checkbox" value="wemail" <cfif listContainsNoCase(myNewsLetter.emailtypes,"wemail") NEQ 0>checked</cfif> />Work<br />
		<input name="memail" type="checkbox" value="memail" <cfif listContainsNoCase(myNewsLetter.emailtypes,"memail") NEQ 0>checked</cfif> />Mobile<br />
		<input name="oemail" type="checkbox" value="oemail" <cfif listContainsNoCase(myNewsLetter.emailtypes,"oemail") NEQ 0>checked</cfif> />Other<br />
		<br />
		<div class="includeGroups">
			<dl id="includeGroups" class="slider">
				<dt>Include Groups</dt>
				<dd class="slideElement">
					<cfset allselected=1>
					<input name="allgroups" type="checkbox" id='sel_all' value="all"/><b>Select All Groups</b><br /><br />
					<cfloop query="myGroups">
						<cfset checkboxstatus="">
						<cfif Trim(myGroups.name) NEQ "do not email">
							<cfinvoke component="#application.objevent#" method="getEventsContainingGroup" eventdsn="#client.siteurl#" groupid="#groupid#" returnvariable="groupevents">
							<cfif listfindnocase(myNewsletter.grouplist,'#groupid#:0',',') GT 0>
								<cfset checkboxstatus="checked">
							<cfelse>
								<cfset allselected=0>
							</cfif>	
							<input name="group#groupid#" type="checkbox" value="#groupid#" class="sel_checkbox" #checkboxstatus#/>#myGroups.name#<br />
							<cfif groupevents.recordcount GT 0>
								<input name="eventgroup#groupid#" type="hidden" value="#groupid#">
								<cfloop query="groupevents">
									<cfset checkboxstatus="">
									<cfif listfindnocase(myNewsletter.grouplist,'#myGroups.groupid#:#eventid#',',') GT 0>
										<cfset checkboxstatus="checked">
									</cfif>
									&nbsp;&nbsp;&nbsp;&nbsp;
									<input type="checkbox" name="groupevent_#myGroups.groupid#_#eventid#" class="not_selall_checkbox" value="1" #checkboxstatus#>#Eventname#<br />
								</cfloop>
							</cfif>
						</cfif>
					</cfloop>
					<script type="text/javascript">check_select_all(#allselected#);</script>
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
					<cfloop query="myGroups">
						<cfset checkboxstatus="">
						<cfif listfindnocase(myNewsLetter.excludegrouplist,'#groupid#:0',',') GT 0>
							<cfset checkboxstatus = "checked">
						</cfif>
						<cfif Trim(myGroups.name) EQ "do not email">
						<input name="donotinclude" DISABLED type="checkbox" value="0" CHECKED/>#myGroups.name#<br />
						<cfelse>
							<input name="excludegroup#groupid#" type="checkbox" value="#groupid#" #checkboxstatus# />#myGroups.name#<br />
							<cfinvoke component="#application.objevent#" method="getEventsContainingGroup" eventdsn="#client.siteurl#" groupid="#groupid#" returnvariable="groupeventsexclude">
							<cfif groupeventsexclude.recordcount GT 0>
								<input name="eventgroupexclude#groupid#" type="hidden" value="#groupid#">
								<cfloop query="groupeventsexclude">
									<cfset checkboxstatus="">
									<cfif listfindnocase(myNewsletter.excludegrouplist,'#myGroups.groupid#:#eventid#',',') GT 0>
										<cfset checkboxstatus="checked">
									</cfif>
									&nbsp;&nbsp;&nbsp;&nbsp;
									<input type="checkbox" name="groupeventexclude_#myGroups.groupid#_#eventid#" value="1" #checkboxstatus#>#Eventname#<br />
								</cfloop>
							</cfif>
						</cfif>
					</cfloop>
					<br />
				</dd>
			</dl>
		</div>
		<div class="clear"></div>
		<cfif (url.newsletterid EQ 0) OR (isSent.recordCount EQ 0)>
			<input type="submit" value="Submit" />
		</cfif>
		</div>
		</div>
		</td>
	</tr>
</table>
</form>
</cfoutput>
