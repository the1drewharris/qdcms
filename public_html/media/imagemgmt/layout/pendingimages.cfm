<cfset selectedapprove=application.objtextconversion.setformvalue('approve')>
<cfset selecteddelete=application.objtextconversion.setformvalue('delete')>
<cfoutput>
	<cfinvoke component="#application.objimagegallery#" method="getPendingImages" imagedsn="#client.siteurl#" returnvariable="pendingimages">
	<cfif pendingimages.recordcount GT 0>
		<form action="/cms/#url.section#/#url.module#/actionpendingimages" method="post">
			<table class="datagrid" id="managePagesTable">
				<tr class="titlebar">
					<th>Submitter</th>
					<th>Title</th>
					<th>Thumb &amp;</th>
					<th>Caption</th>
					<th>Image Status</th>
					<th>Approve</th>
					<th>Delete</th>
				</tr>
				<cfloop query="pendingimages">
					<cfif currentRow MOD 2 EQ 0><tr><cfelse><tr class="alt"></cfif>
						<cfinvoke component="#application.abCFC#" method="getContactInfo" contactdsn="#client.siteurl#" nameid="#CREATEDBYID#" returnvariable="submitter">
						<cfif submitter.recordcount gt 0>
							<td><a href="/cms/crm/addressbook/editcontact/?id=#CREATEDBYID#">#submitter.firstname# #submitter.lastname#</a></td>
						<cfelse>
							<td>Unknown</td>
						</cfif>
						<td>#title#</td>
						<td><a href="/cms/media/imagemgmt/editimage/?i=#imageid#"><img src="#client.imagepath#/tiny/#imagepath#"></a><br /></td>
						<td>#caption#</td>
						<td>#status#</td>
						<td><input type="checkbox" name="approve" value="#imageid#" <cfif listfindnocase(selectedapprove,imageid) GT 0>Checked</cfif>></td>
						<td><input type="checkbox" name="delete" value="#imageid#" <cfif listfindnocase(selecteddelete,imageid) GT 0>Checked</cfif>></td>
					</tr>
				</cfloop>
			</table>
			<input type="submit" name="submit" value="submit">
		</form>
	<cfelse>
		No Pending Images
	</cfif>
</cfoutput>