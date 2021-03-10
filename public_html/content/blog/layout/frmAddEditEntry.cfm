<cfparam  name="url.blogentryid" default="0">
<cfinvoke component="#application.objBlog#" method="getBlogCategories" ds="#client.siteurl#" returnVariable="myCategory">
<cfinvoke component="#application.objBlog#" method="getBlogs" ds="#client.siteurl#" status="published"returnVariable="myBlogs">

<cfoutput>
	<h1>#title#</h1>
	
	<form id="form" action="#formaction#" method="post" onSubmit="return checkForm(this); return false;">
		<input type="hidden" name="blogentryid" value="#url.blogentryid#">
		<table id="webPageEditorTable">
			<tr>
				<td class="mainWebPageInfo">
					<fieldset>
						<div class="clear"></div>
						<label class="name">
							Entry Name<em></em><input type="textbox" value="#application.objtextconversion.setformValue('name')#" name="name"><br />
						</label>
						
						<div class="clear"></div>
						<label class="name">Blog Entry Teaser
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
								fckEditor.value="#application.objtextconversion.setformValue('description')#"; 
								fckEditor.config.ImageBrowserURL = '/media/imagemgmt/actions/imageBrowser.cfm' ;
								fckEditor.config.LinkUpload = false; 
								fckEditor.config.ImageBrowser = true; 
								fckEditor.config.ImageUpload = false; 
								fckEditor.config.FlashBrowser = false; 
								fckEditor.config.FlashUpload = false;
								fckEditor.create(); // create the editor. 
							</cfscript> 
						</label> 
						
						<div class="clear"></div>
						<label class="name">Entry
							<cfscript> 
								basePath = "/fckeditor/";
								fckEditor = createObject("component", "#basePath#fckeditor"); 
								fckEditor.instanceName  = "entry"; 
								fckEditor.ToolbarSet = "qdelta";
								fckEditor.config.SkinPath = "#basePath#skins/qdcms/";
								fckEditor.config.BrowserContextMenuOnCtrl = true ; 
								fckEditor.config.LinkBrowser = false;
								fckEditor.height = '350'; 
								fckEditor.config.TemplatesXmlPath =  '/content/webpages/actions/templateXML.cfm';
								fckEditor.value="#application.objtextconversion.setformValue('entry')#"; 
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
									<input type="Textbox" name="title" value="#application.objtextconversion.setformValue('title')#">
								</label>	
								<label class="name">
									Keywords <em></em><span class="note">Words related to this blog entry, that can be searched for on Search Engines.</span>
									<textarea name="keywords">#application.objtextconversion.setformValue('keywords')#</textarea>
								</label>
								<div class="clear"> </div>
							</dd>
						</dl>
						<br />
						<cfif url.blogentryid NEQ 0>
							<cfinvoke component="comments" method="getComments" ds="#client.siteurl#" returnVariable="myComments" blogentryid="#url.blogentryid#" status="Private">
							<h3>Comments</h3>
							<cfif isDefined('myComments') AND myComments.recordcount NEQ 0>
								<cfloop query="myComments">
									<cfif myComments.createdbyid NEQ 0 OR myComments.createdbyid NEQ "">
									<div style="float:right;"><a href="/content/blog/actions/updatecomment.cfm?status=delete&commentid=#commentid#">Delete Comment</a></div>
									<div style="float:right; margin-right:5px;"><a href="/content/blog/actions/updatecomment.cfm?status=Published&commentid=#commentid#">Approve Comment</a></div>
									<b>Comment by:</b> #blogentrycommentyourname# <br />
									<b>E-mail:</b> #blogentrycommentemail#<br />
									<b>Comment:</b> #comment#<br />
									<hr />	
									</cfif>
								</cfloop>
							<cfelse>
								<h4>*There are no comments to approve for this entry.</h4>
							</cfif>
						</cfif>
					</fieldset>
				</td>
				<td class="quickWebPageInfo">
					<div class="container">
						<div class="clear"></div>
						<cfif myCategory.recordcount EQ 0>
							<h4>*You should create at least one Category before saving this blog entry.</h4>
						<cfelse>
							<h4>Choose a Category for the Entry</h4>
							<cfloop query="myCategory">
								<cfif Application.objtextconversion.setFormValue('blogcategory#blogcategoryid#') NEQ ''>
									<cfset catSelected = "checked">
								<cfelse>
									<cfset catSelected = "">
								</cfif>
								<input name="blogcategory#blogcategoryid#" type="checkbox" value="#blogcategoryid#" #catSelected#  />#myCategory.name#<br />
							</cfloop>
						</cfif>
						
						<cfif myBlogs.recordcount EQ 0>
							<h4>*You should create at least one Blog before saving this blog entry.</h4>
						<cfelse>
							<h4>Choose a Blog for the Entry</h4>
							<cfloop query="myBlogs">
								<cfif Application.objtextconversion.setFormValue('blog#blogid#') NEQ ''>
									<cfset blogSelected = "checked">
								<cfelse>
									<cfset blogSelected = "">
								</cfif>
								<input name="blog#blogid#" type="checkbox" value="#blogid#" #blogSelected#  />#myBlogs.name#<br />
							</cfloop>
						</cfif>
						<div class="clear"></div>
						<cfinclude template="../display/setmeasauthor.cfm">
						
						<div class="clear"></div>
						<cfset status=Application.objtextconversion.setFormValue('entrystatus')>
						<cfif status EQ "">
							<cfset status="Draft">
						</cfif>
						<label class="name">Status
							<select name="EntryStatus">
								<cfloop list="#myStatusList#" index="blogstatus">
									<option <cfif status EQ blogstatus>selected</cfif>>#blogstatus#</option>
								</cfloop>
							</select>
						</label>
						
						<div class="clear"></div>
						<div>Publish on (<font size="1"><i>If future date, status must be published</i></font>)<br />
							<cfset ph=Application.objtextconversion.setFormValue('publishhour')>
							<cfset pmin=Application.objtextconversion.setFormValue('publishmin')>
							<cfset pampm=Application.objtextconversion.setFormValue('pampm')>
							<input id="publishdate" name="publishdate" value="#Application.objtextconversion.setFormValue('publishdate')#" type="text" />
							<select name="publishhour" rel="actual" id="publishhour">
								<cfloop from="1" to="12" index="i">
									<cfif i LT 10><cfset hours="0#i#"><cfelse><cfset hours=i></cfif>
									<option <cfif ph EQ hours>selected</cfif>>#hours#</option>
								</cfloop>
							</select>
							<select name="publishmin" rel="actual" id="publishminute">
								<cfloop from="0" to="59" index="i">
									<cfif i LT 10><cfset mins="0#i#"><cfelse><cfset mins=i></cfif>
									<option <cfif pmin EQ mins>selected</cfif>>#mins#</option>
								</cfloop>
							</select>
							<select name="publishampm" rel="actual" id="publishampm">
								<cfloop list="AM,PM" index="i">
									<option <cfif pampm EQ i>selected</cfif>>#i#</option>
								</cfloop>
							</select>
						</div>
						<input type="submit" name="submit" value="Save" />
					</div>
				</td>
			</tr>
		</table>
	</form>
</cfoutput>