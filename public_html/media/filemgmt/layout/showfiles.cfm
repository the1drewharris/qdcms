<cfinvoke component="#application.objfile#" method="getnonmediafiles" filedsn="#client.siteurl#" returnvariable="files">
<cfoutput>
	<cfif files.recordcount GT 0>
		<h1 style="float:left;">Manage Files</h1>
		<span style="float: left; margin: 10px 0 0 10px">
			<a href="" id="deletefile" title="Delete checked files">Delete</a>
		</span>
		<table class="datagrid" id="managePagesTable">
		<tr class="titlebar">
			<th class="checkbox"><input id="selectAll" type="checkbox" /></th>
			<th>File</th>
			<th>Last Updated</th>
			<th></th>
		</tr>
		<cfloop query="files">
			<tr>
				<td><input type="checkbox" id="file#fileid#" /></td>
				<td><a href="/cms/media/filemgmt/editfile/?fileid=#fileid#">#displayname#</a></td>
				<cfif Trim(lastupdated) NEQ "" AND len(lastupdated) EQ 16>
					<cfset updateddate=application.objtimedateconversion.convertDate(lastupdated,"mm/dd/yyyy")>
					<cfset updatedtime=application.objtimedateconversion.convertTime(lastupdated,"hh:mmtt")>	
				<td>#updateddate# #updatedtime#</td>
				<cfelse>
				<td>#lastupdated#</td>
				</cfif>
				<td><a href="http://#client.siteurl#/files/#serverfilename#">View File</a></td>
			</tr>
		</cfloop>
		</table>
	<cfelse>
		<div class="quicknote">
			<h1>There are no files added to this site</h1>
		</div>
	</cfif>
</cfoutput>