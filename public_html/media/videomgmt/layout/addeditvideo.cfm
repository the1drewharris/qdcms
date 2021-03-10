<cfoutput>
	<cfparam name="filesExists" default="false">
	<h1>#title#</h1>
	<form action="/cms/#url.section#/#url.module#/#formaction#" id="form" method="post" enctype="multipart/form-data">
		<input type="hidden" name="vid" value="#application.objtextconversion.setFormValue('vid')#">
		<input type="hidden" name="videocategoryid" value="#url.id#">
		<table id="webPageEditorTable"  class="htmform" cellpadding="3" >
		  	<tr>
				<td class="mainWebPageInfo">
					<fieldset>
						<label class="name">Title
				    		<input type="text" name="title" value="#application.objtextconversion.setformValue('title')#" />
						</label>
						
						<cfif url.action EQ 'addvideo'>
							<label class="name">Video
								<input type="file" name="video" size="63">
							<label>
						</cfif>
						
						<label class="name">Image
							<input type="file" name="photoupload" size="63">
						<label>
						
						<label class="name">Link
							<input type="text" name="link" value="#application.objtextconversion.setformvalue('link')#">
						</label>
						
						<cfset mystatus=application.objtextconversion.setformvalue('status')>
						<label class="name"> Status
							 <select name="status">
								 <cfloop list="Public,Private,Inactive" index="status">
									 <option value="#status#" <cfif mystatus EQ status> selected</cfif>>#status#</option>
								 </cfloop>
							 </select>
						</label>
						
						<cfset summaryEditor = Application.fckeditor>
						<cfset summaryEditor.instanceName="summary"> 
						<cfset summaryEditor.value=Application.objtextconversion.setformvalue('summary')>
						<label class="name">Summary
							<cfset summaryEditor.create()>
						</label>
						
						<cfset descriptionEditor=Application.fckeditor>
						<cfset descriptionEditor.instanceName="description">
						<cfset descriptionEditor.value=Application.objtextconversion.setformvalue('description')>
						<label class="name">Description
							<cfset descriptionEditor.create()>
						</label>
						
						<cfset CaptionEditor=Application.fckeditor>
						<cfset CaptionEditor.instanceName="caption">
						<cfset CaptionEditor.value=Application.objtextconversion.setformvalue('caption')>
						<label class="name">Caption
							<cfset CaptionEditor.create()> 
						</label>
						
						<label class="name">Keywords
							<textarea name="keywords">#application.objtextconversion.setformvalue('keywords')#</textarea>
						</label>
						
						<cfset spvalue=application.objtextconversion.setformvalue('subscriableproduct')>
						<label class="checkbox">
							<input type="checkbox" name="subscriableproduct" value="1" <cfif spvalue EQ 1>Checked</cfif>>This media is a subscriable product
						</label>
						
						<div id="product">
							<h3>Subscriable Product Information</h3><br />
							<input type="hidden" name="sampleid" value="#application.objtextconversion.setformvalue('sampleid')#">
							<label class="name" id="price">Default Price
								<input type="text" name="subs_price" value="#application.objtextconversion.setformvalue('subs_price')#">
							</label>
							
							<label class="name">Sample Video
								<input type="file" name="sample" size="63">
							</label>
							
							<label class="name">Sample Name
								<input type="text" name="samplename" value="#application.objtextconversion.setformvalue('samplename')#">
							</label>
						</div>

						<div id="forFiles">
							<cfif filesExists>
								<cfset deleteselected=Application.objtextconversion.setformvalue('deletefiles')>
								<input type="hidden" name="filelist" value="#valuelist(files.fileid)#">
								<h3>Associated Files</h3> <br />
								<cfloop query="files">
									<label class="name">Title
										<input name="title_#fileid#" type="text" value="#title#">
									</label>
									<label class="name">
										<textarea name="description_#fileid#">#description#</textarea>
									</label>
									<label class="checkbox">
										<input type="checkbox" name="deletefiles" value="#fileid#" <cfif listfindnocase(deleteselected,fileid) GT 0>Checked</cfif>>Delete this file <br />
									</label>  
								</cfloop>
							</cfif>
						</div>
					</fieldset>
				</td>
				<td class="quickWebPageInfo">
					<div class="container">
						<cfset imgpath=application.objtextconversion.setformvalue('imagepath')>
						<cfif url.action EQ 'editvideo'>
							<a href="/cms/#url.section#/#url.module#/watchvideo/?v=#url.v#"><img src="#client.imagepath#/#imgpath#" width="265"></a>
						</cfif>
					</div>
				</td>
		 	</tr>
		 	<tr>
		   		<td colspan="2">
					<input type="submit" name="Submit" value="Submit" >
				</td>
		 	</tr>
		</table>
	</form>
</cfoutput>