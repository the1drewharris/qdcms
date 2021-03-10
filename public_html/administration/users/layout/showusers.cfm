<cfoutput>
	<cfset args=StructNew()>
	<cfset args.nameid=client.masternameid>
	<cfset args.siteid=client.siteid>
	<cfinvoke component="#application.objqdsecurity#" method="getSecurityUsers" argumentcollection="#args#" returnvariable="SecurityUsers">
	
	<cfif SecurityUsers.recordcount GT 0>
		<h1 style="float: left;">Users</h1>
		<table class="datagrid" id="managePagesTable">
			<tr class="titlebar">
				<th>Name</th>
				<th>Address</th>
				<th>Email</th>
				<th>Phone</th>
				<th>Security Role</th>
			</tr>
			<cfloop query="SecurityUsers">
				<tr>
					<td><a href="/cms/administration/users/edituser/?userid=#nameid#">#firstname# #lastname#</a></td>
					<td>
						#address1# #address2# <br />
						#city# #state# #zip#
					</td>
					<td>#wemail#</td>
					<td>
						<cfif hphone NEQ "">Home phone: #hphone#<br /></cfif>
						<cfif wphone NEQ "">Work phone: #wphone#<br /></cfif>
						<cfif mphone NEQ "">Cell phone: #mphone#<br /></cfif>
					</td>
					<td><a href="/cms/administration/users/editpermission/?userid=#nameid#">#role#</a></td>
				</tr>
			</cfloop>
		</table>
	</cfif>
</cfoutput>