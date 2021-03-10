<cfoutput>
	<h1>#title#</h1>
	<form action="/cms/marketing/newsletter/#formaction#" method="post" enctype="multipart/form-data" id="form">
		<input type="hidden" name="newslettertemplateid" value="#application.objtextconversion.setFormValue('newslettertemplateid')#" />
		<table id="webPageEditorTable">
			<tr><td class="mainWebPageInfo">
				<fieldset>
					<label class="name">
						Name<em></em><input type="textbox" value="#application.objtextconversion.setFormValue('name')#" name="name"><br />
					</label>
					<div class="clear"></div>
					
					<cfset templatestatus=application.objtextconversion.setFormValue('status')>
					<label class="name">
						<select name="status">
							<option value="Published" <cfif templatestatus EQ 'Published'>Selected</cfif>>Published</option>
							<option value="Shared" <cfif templatestatus EQ 'Shared'>Selected</cfif>>Shared</option>
						</select>
					</label>
					<div class="clear"></div>
					
					<label class="name">
						Description <em></em><span class="note">A few sentences about this template to help describe it.</span>
						<textarea name="description">#application.objtextconversion.setFormValue('description')#</textarea>
					</label>
					<div class="clear"></div>
					
					<label class="name">
						HTML Template <em></em><span class="note">Paste or type your HTML for your template.</span>
						<cfscript> 
							basePath = "/fckeditor/";
							fckEditor = createObject("component", "#basePath#fckeditor"); 
							fckEditor.instanceName  = "template"; 
							fckEditor.ToolbarSet = "qdelta";
							fckEditor.config.SkinPath = "#basePath#skins/qdcms/";
							fckEditor.config.BrowserContextMenuOnCtrl = true ; 
							fckEditor.config.LinkBrowser = false;
							fckEditor.height = '350'; 
							fckEditor.config.TemplatesXmlPath =  '/marketing/newsletter/actions/templateXML.cfm';
							fckEditor.value="#application.objtextconversion.setFormValue('template')#"; 
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
					
					<label class="name">
						Thumb Image<br />
						<input type="file" name="imagepath" size="45">
					<label>
				</fieldset>
				<div class="clear"></div>
				
				<input type="submit" name="submit" value="Save" />
			</td>
			<td class="quickWebPageInfo">
				<div class="container">
				<div class="clear"></div>
					<cfset imgpath=application.objtextconversion.setFormValue('imagepath')>
					<cfif imgpath EQ ''>
						<br /><br />
						<center><h2>Your uploaded <br />image will be <br />displayed here</h2></center>
						<br /><br />
					<cfelse>
						<br /><br />
						<center><img src="http://#client.siteurl#/images/qdcms/#imgpath#"></center>
						<br /><br />
					</cfif>
				</div>
			</td>
			</tr>
		</table>
	</form>
	<div class="clear"> </div>
</cfoutput>