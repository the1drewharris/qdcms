<cfparam name="url.id" default="0">
<cfparam name="url.v" default="0">
<cfset allisWell=FALSE>
<cfset thisVideoStatus=application.objvideolib.getVideoStatus(client.siteurl,url.v)>
<cfif thisVideoStatus NEQ ''>
	<cfif listfindnocase('Public,Private',thisVideoStatus) GT 0>
		<cfset allIsWell=TRUE>
	<cfelse>
		<cfset client.message="The video is deleted. Please restore the video to add file to it">
	</cfif>
<cfelse>
	<cfset client.message="The video does not exist.">
</cfif>
<cfif allIsWell>
	<cfinvoke component="#application.objfile#" method="getfiles" filedsn="#client.siteurl#" id="#url.v#" returnvariable="files">
	<cfoutput>
		<h1>#title#</h1>
		<form action="/cms/#url.section#/#url.module#/#formaction#" method="post" id="form" enctype="multipart/form-data">
			<input type="hidden" name="albumid" value="#url.id#">
			<input type="hidden" name="id" value="#url.v#">
			<table id="webPageEditorTable"  class="htmform" cellpadding="3">
			  	<tr>
					<td class="mainWebPageInfo">
						<fieldset>
							<label class="name">Title
					    		<input type="text" name="title" value="#application.objtextconversion.setformValue('title')#" />
							</label>
							
							<label class="name">File
								<input type="file" name="file" size="65">
							<label>
							
							<label class="name">Description
								<textarea name="description">#application.objtextconversion.setformValue('description')#</textarea>
							</label>
						</fieldset>
					</td>
					<td class="quickWebPageInfo">
						<cfif files.recordcount GT 0>
							<div class="container">
								<table class="datagrid" id="managePagesTable">
									<cfloop query="files">
										<cfif currentRow MOD 2 EQ 0><tr class="alt"><cfelse><tr></cfif>
											<td>#title#</td>
											<td><a href="#client.filepath#/#filename#">Download</a></td>
										</tr>
									</cfloop>
								</table>
							</div>
						</cfif>
					</td>
			 	</tr>
			 	<tr>
			   		<td colspan="2">
						<input type="submit" name="Submit" value="Submit">
					</td>
			 	</tr>
			</table>
		</form>
	</cfoutput>
<cfelse>
	<cflocation url="/cms/#url.section#/#url.module#/showalbums/id=#url.id#" addtoken="false">
</cfif>