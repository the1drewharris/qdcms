<cfoutput>
	<cfif NOT thereAreErrors>
		<cfset client.referer=CGI.HTTP_REFERER>
	</cfif>
	<cfinvoke component="#Application.abCFC#" method="getContactInfo" contactdsn="#client.siteurl#" nameid="#url.id#" returnVariable="info">
	<cfinvoke component="#application.objcomments#" method="getComments" ds="#client.siteurl#" nameid="#url.id#" returnVariable="notes">
	<cfif info.firstname NEQ ''>
		<cfset myinfo="#info.firstname# #info.lastname#">
	<cfelseif info.company NEQ ''>
		<cfset myinfo="#info.company#">
	</cfif>
	<h1>#title# #myinfo#</h1>
	<form action="/cms/#url.section#/#url.module#/#formaction#" id="form" method="post">
		<input type="hidden" name="nameid" value="#url.id#">
		<table id="webPageEditorTable">
		  	<tr>
				<td class="mainWebPageInfo">
					<fieldset>
						<label class="name" for="subject">Subject
				    		<input type="text" name="subject" value="#application.objtextconversion.setformValue('subject')#" />
						</label>
						<label class="name" for="to">To Email
				    		<input type="text" name="To" value="#application.objtextconversion.setformValue('subject')#" />
						</label>
						<cfset thisstatus=application.objtextconversion.setformvalue('status')>
						<label class="name" for="status">Status
							<select name="status">
								<option value="Private">Private</option>
								<option value="Public" <cfif thisstatus EQ 'Public'>Selected</cfif>>Public</option>
							</select>
						</label>
						<label class="name">Note
							<textarea name="comment">#application.objtextconversion.setformvalue('comment')#</textarea>
						</label>
					</fieldset>
				</td>
		 	</tr>
		 	<tr>
		   		<td colspan="2">
					<input type="submit" name="Submit" value="Submit" >
				</td>
		 	</tr>
		 	<tr>
				<td>
					<cfif notes.recordcount GT 0> <br /> <br />
						<dl id="viewNotesDL" class="slider">
							<dt id="viewNotesDT">View Notes</dt>
							<dd class="slideElement">
								<cfloop query="notes">
									<p>
										<h3>#Mid(commentid,5,2)#/#Mid(commentid,7,2)#/#Left(commentid,4)#
											<cfif len(commentname) GT 0>: #commentname#</cfif>
										</h3>
									</p>
									<p>
									<cfif len(comment) GT 0>#REReplace(comment,"#chr(10)#","<br />","All")#<br /></cfif>
									<cfinvoke component="#Application.abCFC#" method="getContactInfo" contactdsn="deltasystem" nameid="#createdbyid#" returnvariable="author">
									Posted by: #author.firstname# #author.lastname#
									</p>
								</cfloop>
							</dd>
						</dl>
					</cfif>
				</td>
			</tr>
		</table>
		</form>
</cfoutput>