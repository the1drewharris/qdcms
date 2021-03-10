<cfoutput>
	<cfif url.action EQ "editblogEntry">
		<cfset authorid=Application.objtextconversion.setFormValue('authorid')>
		<cfif Application.objtextconversion.setFormValue('setme') NEQ ''>
			<cfset checked=TRUE>
		<cfelse>
			<cfset checked=FALSE>
		</cfif>
		<input type="hidden" name="authorid" value="#authorid#">
		<cfif authorid NEQ client.masternameid>
			<br /><br />
			<cfinvoke component="#application.abCFC#" method="searchContacts" contactdsn="#application.masterdsn#" userid="#authorid#" returnvariable="entryAuthor">
			<b>Author:<i>#entryAuthor.firstname# #entryAuthor.lastname#</i></b> <br />
			<input name="setme" value="1" type="checkbox" <cfif checked>Checked</cfif>>Set me as Author <i>#client.firstname# #client.lastname#</i>
			<br /><br />
		</cfif>
	</cfif> <br />
</cfoutput>