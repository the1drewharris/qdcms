<cfinvoke component="newsletter" method="getnewsletter" returnvariable="mynewsletter" newsletterdsn="#client.siteurl#" newsletterid="#url.newsletterid#">
<cfoutput>
<table  class="datagrid">
	<tr class="titlebar"><th>Edit Newsletter</th></tr>
	<tr><td>
	<form id="form" method="post" action="/content/newsletter/actions/editnewsletter.cfm">
		<fieldset>
			<input type="hidden" name="newsletterid" value="#url.newsletterid#">
			
			<label class="name">Name
				<input type="text" name="name" value="#mynewsletter.name#" class="fValidate['required']">
			</label>
			
			<label class="name">Subject
				<input type="text" name="subject" value="#mynewsletter.subject#" >
			</label>
			
			<cfinvoke component="newsletter" method="gettemplate" newsletterdsn="#client.siteurl#" returnvariable="templates">
			<label class="name">Template
				<select name="newslettertemplateid" class="fValidate['required']">
					<cfloop query="templates">
					<option value="#newslettertemplateid#"<cfif newslettertemplateid EQ mynewsletter.newslettertemplateid>Selected</cfif>>#name#</option>
					</cfloop>
				</select>
			</label>
			
			<!--- <label class="name">HTML Newsletter
				<textarea name="htmlnewsletter">#mynewsletter.htmlnewsletter#</textarea>
			</label> --->
			
			<label class="name">HTML Newsletter
			<cfscript> 
			basePath = "/fckeditor/";
			fckEditor = createObject("component", "#basePath#fckeditor"); 
			fckEditor.instanceName  = "htmlnewsletter"; 
			fckEditor.ToolbarSet = "qdelta";
			fckEditor.config.SkinPath = "#basePath#skins/qdcms/";
			fckEditor.config.BrowserContextMenuOnCtrl = true ; 
			fckEditor.config.LinkBrowser = false;
			fckEditor.height = '350'; 
			fckEditor.value = '#mynewsletter.htmlnewsletter#' ;
			fckEditor.config.ImageBrowserURL = '#Client.siteurl#' ;
			fckEditor.config.LinkUpload = false ; 
			fckEditor.config.ImageBrowser = true ; 
			fckEditor.config.ImageUpload = false ; 
			fckEditor.config.FlashBrowser = false ; 
			fckEditor.config.FlashUpload = false ;
			fckEditor.create(); // create the editor. 
			</cfscript> 
			</label>
	
			<label class="name">Text Newsletter
				<textarea name="textnewsletter">#mynewsletter.textnewsletter#</textarea>
			</label>
		</fieldset>
		<input name="submit" type="submit" value="submit">
	</form>
	</td></tr>
</table>
</cfoutput>