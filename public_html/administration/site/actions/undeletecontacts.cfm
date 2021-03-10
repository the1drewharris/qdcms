<cfquery name="undelete" datasource="#client.siteurl#">
	UPDATE NAME SET STATUS=1
</cfquery>