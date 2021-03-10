<cfparam name="url.w" default="0">
<cfinvoke component="#application.objwebpage#" method="getmyelligibleparent" webdsn="#client.siteurl#" wpid="#url.w#" returnvariable="parents">
<cfset wpstatuslist="Draft,Published,Shared,Deactive">
<cfoutput>
	<h1>#title#</h1>
	<form id="form" action="/cms/content/webpages/#formaction#" method="post">
		<input type="hidden" name="wpid" value="#application.objtextconversion.setformvalue('wpid')#">
		<table id="webPageEditorTable">
			<tr>
				<td class="mainWebPageInfo">
					<fieldset>
						<cfset myparent=application.objtextconversion.setformvalue('pid')>
						<label class="name">
							Parent <em></em>
							<select name="pid">
								<option value="0">Main Level Item (No Parent)</option>
								<cfloop query="parents">
								<option value="#wpid#" <cfif myparent Eq wpid>SELECTED</cfif>>
									<cfif NESTLEVEL GT 0><cfloop from="1" to="#NESTLEVEL#" index="i"> &mdash;</cfloop></cfif>#name#
								</option>
								</cfloop>
							</select>
						</label>
						<label class="name">
							Name<em></em><input type="text" name="name" value="#application.objtextconversion.setformvalue('name')#"><br />
						</label>
			
						<label class="name">Content
						<cfscript> 
						basePath = "/fckeditor/";
						fckEditor = createObject("component", "#basePath#fckeditor"); 
						fckEditor.instanceName  = "wpcontent"; 
						fckEditor.ToolbarSet = "qdelta";
						fckEditor.config.SkinPath = "#basePath#skins/qdcms/";
						fckEditor.config.BrowserContextMenuOnCtrl = true ; 
						fckEditor.config.LinkBrowser = false;
						fckEditor.height = '350'; 
						fckEditor.config.TemplatesXmlPath= '/content/webpages/actions/templateXML.cfm';
						fckEditor.value="#application.objtextconversion.setformvalue('wpcontent')#"; 
						fckEditor.config.ImageBrowserURL = '/media/imagemgmt/actions/imageBrowser.cfm' ;
						fckEditor.config.LinkUpload = false ; 
						fckEditor.config.ImageBrowser = true ; 
						fckEditor.config.ImageUpload = false ; 
						fckEditor.config.FlashBrowser = false ; 
						fckEditor.config.FlashUpload = false ;
						fckEditor.create(); // create the editor. 
						</cfscript> 
						</label>
						<div class="clear"></div>
							<h3>Advanced Options</h3>
						<dl id="advancedDL" class="slider">
							<dt>Search Engine</dt>
							<dd class="slideElement">
								<label class="name">
								Title <em></em><span class="note">Page title used for Search Engines.</span>
								<input type="Textbox" name="title" value="#application.objtextconversion.setformvalue('title')#">
								</label>	
								<label class="name">
									Keywords <em></em><span class="note">Words related to this page, that can be searched for on Search Engines.</span>
									<textarea name="keywords">#application.objtextconversion.setformvalue('keywords')#</textarea>
								</label>
								<label class="name">
									Description <em></em><span class="note">A few sentences about this page that Search Engines' can use to display in results.</span>
									<textarea name="description">#application.objtextconversion.setformvalue('description')#</textarea>
								</label>
								<div class="clear"> </div>
							</dd>
						</dl>
					</fieldset>
				</td>
				<td class="quickWebPageInfo">
				<div class="container">
					<cfif url.action EQ "editwebpage">
						<cfset latestversion=application.objtextconversion.setformvalue('previousVersions')>
						<cfinvoke component="#application.objwebpage#" method="getPageVersions" webdsn="#client.siteurl#" wpid="#url.w#" returnVariable="versions">
						<label class="name">
							<cfif versions.recordCount GT 1>
								Versions
								<select name="previousVersions" id="previousVersions">
									<cfloop query="versions">
										<option value="#createdon#" <cfif latestversion EQ createdon>selected</cfif>>#application.objtimedateconversion.convertDate(createdon,"mm/dd/yyyy")# #application.objtimedateconversion.convertTime(createdon,"h:mmtt")#: #name#</option>
									</cfloop>
								</select>
							<cfelse>
								<br />
								<small><em>There are currently no previous versions for this web page.</em></small>
							</cfif>
						</label>
					</cfif>
					<cfset thiswpstatus=application.objtextconversion.setformvalue('wpstatus')>
					<label class="name">Status
						<select name="wpstatus">
						<cfloop list="#wpstatusList#" index="wpstatus">
							<option value="#wpstatus#" <cfif thiswpstatus EQ wpstatus>selected</cfif>>#wpstatus#</option>
						</cfloop>
						</select>
					</label>
					<input type="submit" value="Save" />
				</div>
				</td>
			</tr>
		</table>
	</form>
</cfoutput>