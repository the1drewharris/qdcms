<cfinvoke component="#Application.abCFC#" method="getGroupName" contactdsn="#client.siteurl#" returnVariable="groups">
<cfoutput>
	<div class="options" id="groupoptions">
		<h3>Select contacts and the groups you want the contacts to copy to</h3>
		<form id="form" method="post" action="/cms/#url.section#/#url.module#/actioncopycontacts">
			<cfloop query="groups">
				<div style="float:left"><input type="checkbox" id="group_#groupid#" name="grouplist" value="#groupid#">&nbsp;#name#</div>
			</cfloop>
			<span style="float:right">
				<a href="##" id="copycontacts">Copy Contacts</a>
			</span>
		</form>
	</div>
	<div class="clear"></div><br />
</cfoutput>