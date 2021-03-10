<cfoutput>
	<cfinvoke component="#Application.abCFC#" method="getGroupName" contactdsn="#client.siteurl#" returnVariable="groups" />
	<h1>Upload Contacts</h1>
	<form action="/cms/#url.section#/#url.module#/actionuploadcontacts" id="form" method="post" enctype="multipart/form-data">
		<table id="webPageEditorTable"  class="htmform" cellpadding="3" >
		  	<tr>
				<td class="mainWebPageInfo">
					<fieldset>
						<label class="name">Upload Excel Spreadsheet(.xls or .xslx)
				    		<input type="file" name="filedata" size="60">
						</label>
						<input type="submit" name="Submit" value="Upload">
					</fieldset>
				</td>
				<cfset mygroups=application.objtextconversion.setformvalue('grouplist')>
				<td class="quickWebPageInfo">
					<div class="container">
						<h1>Groups</h1>
						<cfloop query="groups">
							<input type="checkbox" name="grouplist" value="#groupid#" <cfif listfindnocase(mygroups,groupid)>checked</cfif>>#name#<br />
						</cfloop>
					</div>
				</td>
		 	</tr>
		 	<tr>
		   		<td colspan="2">
				</td>
		 	</tr>
		</table>
	</form>
</cfoutput>