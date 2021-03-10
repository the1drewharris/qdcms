<cfoutput>
<cfobject component="formvalidation" name="objformvalidation">
<cfif isDefined('form.submit')>
	<cfset objformvalidation.set_rules('name','Template name','required')>
	<cfset objformvalidation.set_rules('template','HTML Template','required')>
	<cfif objformvalidation.isvalidform()>
		<cfset args=structNew()>
		<cfset args.ds=client.siteurl>
		<cfset args.name=form.name>
		<cfset args.description=form.description>
		<cfset args.template=form.template>
		<cfset args.status=form.status>
		<cfif isDefined('form.imagepath') AND (Trim(form.imagepath) NEQ "")>
			<cfinclude template="/marketing/newsletter/actions/addTemplateImage.cfm">
			<cfset args.imagepath=newImageName>
		</cfif>
		<cfif trim(form.newslettertemplateid) EQ "">
			<cfinvoke component="#application.objnewsletter#" method="addTemplate" argumentcollection="#args#">
		<cfelse>
			<cfset args.newslettertemplateid=form.newslettertemplateid>
			<cfinvoke component="#application.objnewsletter#" method="editTemplate" argumentcollection="#args#">
		</cfif>
		<cflocation url="/cms/marketing/newsletter/managetemplate" addtoken="false">
	<cfelse>
		<font color="RED">#objformvalidation.validation_errors()#</font>
	</cfif>
<cfelseif formaction EQ "edittemplate">
	<cfparam name="url.newslettertemplateid" default="0">
	<cfif url.newslettertemplateid NEQ "0">
		<cfset args=structnew()>
		<cfset args.ds=client.siteurl>
		<cfset args.newslettertemplateid=url.newslettertemplateid>
		<cfinvoke component="#application.objnewsletter#" method="getTemplate" argumentcollection="#args#" returnvariable="mytemplate">
		<cfset form.name=mytemplate.name>
		<cfset form.description=mytemplate.description>
		<cfset form.template=mytemplate.template>
		<cfset form.newslettertemplateid=mytemplate.newslettertemplateid>
		<cfset form.imagepath=mytemplate.imagepath>
		<cfset form.status=mytemplate.status>
	<cfelse>
		<cfset qdcmsTitle="Add Newsletter Template">
		<cfset formaction="addtemplate">
	</cfif>
</cfif>

<h1>#qdcmsTitle#</h1>
<form action="/cms/marketing/newsletter/#formaction#" method="post" enctype="multipart/form-data" id="form">
	<input type="hidden" name="newslettertemplateid" value="#objformvalidation.set_value('newslettertemplateid')#" />
	<table id="webPageEditorTable">
		<tr><td class="mainWebPageInfo">
			<fieldset>
				<label class="name">
					Name<em></em><input type="textbox" value="#objformvalidation.set_value('name')#" name="name"><br />
				</label>
				<div class="clear"></div>
				<label class="name">
					<select name="status">
						<option value="Published" <cfif objformvalidation.set_value('status') EQ 'Published'>Selected</cfif>>Published</option>
						<option value="Shared" <cfif objformvalidation.set_value('status') EQ 'Shared'>Selected</cfif>>Shared</option>
					</select>
				</label>
				<div class="clear"></div>
				<label class="description">
					Description <em></em><span class="note">A few sentences about this template to help describe it.</span>
					<textarea name="description" style="width:560px">#objformvalidation.set_value('description')#</textarea>
				</label>
				<div class="clear"></div>
				<label class="description">
					HTML Template <em></em><span class="note">Paste or type your HTML for your template.</span>
							<!--- <textarea name="template" style="width:560px">#objformvalidation.set_value('template')#</textarea> --->
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
			fckEditor.value='#objformvalidation.set_value('template')#'; 
			fckEditor.config.ImageBrowserURL = '/marketing/newsletter/display/imageBrowser.cfm' ;
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
				<cfif NOT isDefined('form.imagepath')  OR Trim(form.imagepath) EQ "">
					<br /><br />
					<center><h2>Your uploaded <br />image will be <br />displayed here</h2></center>
					<br /><br />
				<cfelse>
					<br /><br />
					<center><img src="http://#client.siteurl#/images/qdcms/#form.imagepath#"></center>
					<br /><br />
				</cfif>
			</div>
		</td>
		</tr>
	</table>
</form>
<div class="clear"> </div>
</cfoutput>


