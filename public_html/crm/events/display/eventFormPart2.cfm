<cfoutput>
<div class="email">
	<dl id="emailDL" class="slider">
		<dt id="emailDT">Email to Send <small>Optional</small></dt>
		<dd class="slideElement">
			<fieldset>
				<label class="name">From
					<input type="text" name="fromEmail" value="#application.objtextconversion.setFormValue('fromEmail')#">
				</label>
				<label class="name">CC
					<input type="text" name="cc" value="#application.objtextconversion.setFormValue('cc')#">
				</label>
				<label class="name">Subject
					<input type="text" name="subject" value="#application.objtextconversion.setFormValue('subject')#">
				</label>
				<label class="name">Message
					<cfscript> 
						basePath = "/fckeditor/";
						fckEditor = createObject("component", "#basePath#fckeditor"); 
						fckEditor.instanceName  = "Message"; 
						fckEditor.ToolbarSet = "qdelta";
						fckEditor.config.SkinPath = "#basePath#skins/qdcms/";
						fckEditor.config.BrowserContextMenuOnCtrl = true; 
						fckEditor.config.LinkBrowser = false;
						fckEditor.height = '350'; 
						fckEditor.config.TemplatesXmlPath =  '/content/webpages/actions/templateXML.cfm';
						fckEditor.value = application.objtextconversion.setFormValue('message'); 
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
		</dd>
	</dl>
</div>
<br /><div class="clear"></div>
</cfoutput>