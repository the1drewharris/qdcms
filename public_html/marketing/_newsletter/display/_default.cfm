<cfif isDefined('form.keyword')>
	<cfset form.newsletterdsn=Client.siteurl>
	<cfinvoke component="newsletter" method="searchNewsletter" returnvariable="newsletters" argumentcollection="#form#">
<cfelse>
<cfinvoke component="newsletter" method="getnewsletter" returnvariable="newsletters" ds="#client.siteurl#">
</cfif>
<cfif newsletters.recordcount GT 0>
	<table class="datagrid" width="910">
		<tr class="titlebar"><th>Name</th><th>Subject</th><th>Created on</th><th>Last Updated</th><th>Template</th></tr>
		<cfoutput query="newsletters">
			<tr>
				<td>
					<a href="/index.cfm?section=content&module=newsletter&action=editnewsletter&newsletterid=#newsletterid#">#name#</a>
					(<a href="/index.cfm?section=content&module=newsletter&action=queue">Enqueue</a>)
				</td>
				<td>#Subject#</td>
				<cfset createddate=convertDate(createdon,"mm/dd/yyyy")>
				<cfset createdtime=convertTime(createdon,"hh")>
				<cfset createdtime=createdtime & ":" & convertTime(createdon,"mm")>
				<cfset ampm=convertTime(createdon,"tt")>
				<cfif ampm eq "pm">
					<cfset createdtime=createdtime & " " & "PM">
				<cfelse>
					<cfset createdtime=createdtime & " " & "AM">
				</cfif>
				<td>#createddate# #createdtime#</td>
				
				<cfset updateddate=convertDate(updatedon,"mm/dd/yyyy")>
				<cfset updatedtime=convertTime(updatedon,"hh")>
				<cfset updatedtime=updatedtime & ":" & convertTime(updatedon,"mm")>
				<cfset ampm=convertTime(updatedon,"tt")>
				<cfif ampm eq "pm">
					<cfset updatedtime=updatedtime & " " & "PM">
				<cfelse>
					<cfset updatedtime=updatedtime & " " & "AM">
				</cfif>
			
				<td>#updateddate# #updatedtime#</td>
				
				<td>#newslettertemplatename#</td>
			</tr>
		</cfoutput>
	</table>
<cfelse>
	It's time to add a Newsletter.
</cfif>