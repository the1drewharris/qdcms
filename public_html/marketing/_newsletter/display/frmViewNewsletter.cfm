<!--- CFINVOKE to Get Published and Draft Pages --->

<script type="text/javascript" src="/js/lib/marketing/newsletter/default.js"></script>
<cfoutput>
<cfif NOT getMyNewsletter.recordCount>
	<div class="quicknote">
		<h1>There are currently no Newsletters for this site. 
		<a href="/cms/marketing/newsletter/addNewsletter">Click here</a> to add your first Newsletter!</h1>
		<p>It is really easy, plus every site needs at least one Newsletter!</p>
	</div>	
<cfelse>
	<cfparam name="client.quicknote" default="">

	<cfif len(client.quicknote)>
		<cfoutput>#client.quicknote#</cfoutput>
		<cfset client.quicknote = "">
	</cfif>
		<h1 style="float: left;">Newsletter</h1>
		<span style="float: left; margin: 10px 0 0 10px">
			<!--- Uncomment if you ever want to add the copy function to this page, it has been tested and is working. --->
			<a href="" id="copy" title="Copy checked Newsletter">Copy</a> 
			<a href="" id="delete" title="Delete checked Newsletter">Delete</a>
		</span>
		
		<span style="float: right; margin: 10px 10px 0 10px">
			<table>
				<tr>
					<form id="form" method="post" action="/index.cfm?section=marketing&module=newsletter">
					<td align="right"><label class="name">Search</label></td>
					<td align="right"><input name="keyword" type="text"></td>
					<td><input name="submit" type="submit" value="submit"></td>
					<td width="20px"></td>
					<td><a href="/cms/marketing/newsletter/addNewsletter" id="add newsletter" title="Add Newsletter">+ Add Newsletter</a></td>
					</form>
				</tr>
			</table>
		</span>
		<div class="clear"> </div>
	<cfif getMyNewsletter.recordcount EQ 0>No records returned <cfabort></cfif>
	<cfparam name="URL.PageIndex" default="0">
	<cfset RecordsPerPage = 10>
	<cfset TotalPages = Int(getMyNewsletter.Recordcount/RecordsPerPage)>
	<cfif (getMyNewsletter.Recordcount mod RecordsPerPage) EQ 0>
		<cfset TotalPages=TotalPages-1>
	</cfif>
	<cfset StartRow = (URL.PageIndex*RecordsPerPage)+1>
	<cfset EndRow = StartRow+RecordsPerPage-1> 
	<table class="datagrid" id="managePagesTable">
		<tr class="titlebar">
			<th class="checkbox"><input id="selectAll" type="checkbox" /></th>
			<th>Name</th>
			<th>Subject</th>
			<th>Created on</th>
			<th>Last Updated</th>
			<th>Status</th>
			<th>View Report</th>
		</tr>
		<cfloop query="getMyNewsletter">
		<cfif CurrentRow gte StartRow >
		<cfif currentRow MOD 2 EQ 0>
		<tr class="alt">
		<cfelse>
		<tr>
		</cfif>
			<td><input type="checkbox" id="newsletter#newsletterid#" /></td>
			<td>
				<a href="/cms/marketing/newsletter/editNewsletter/?newsletterid=#newsletterid#" class="name" title="Edit &quot;#name#&quot;">#name#</a>			
			</td>
			<td>#subject#</td>
			
				<cfset createddate=convertDate(Createdon,"mm/dd/yyyy")>
				<cfset createdtime=convertTime(Createdon,"hh")>
				<cfset ampm=convertTime(Createdon,"tt")>
				
				<cfset createdtime=createdtime & ":" & convertTime(Createdon,"mm")>
	  			<cfif ampm eq "pm">
					<cfset createdtime=createdtime & " PM">
				<cfelse>
					<cfset createdtime=createdtime & " AM">
				</cfif>
				
	  		<td>#createddate# #createdtime#</td>
	  			<cfset updateddate=convertDate(updatedon,"mm/dd/yyyy")>
				<cfset updatedtime=convertTime(updatedon,"hh")>
				<cfset ampm=convertTime(updatedon,"tt")>
				
				<cfset updatedtime=updatedtime & ":" & convertTime(updatedon,"mm")>
				<cfif ampm eq "pm">
					<cfset updatedtime=updatedtime & " PM">
				<cfelse>
					<cfset updatedtime=updatedtime & " AM">
				</cfif>
			
			<td>#updateddate# #updatedtime#</td>
			<td><cfif sent EQ '1'>Sent<cfelseif sent EQ '2'>Sending<cfelse>Not Sent</cfif></td>
			<td align="center"><a href="/cms/marketing/newsletter/viewreport/?newsletterid=#newsletterid#">View</a></td>
		</tr>
		</cfif>
		<cfif CurrentRow eq EndRow><cfbreak></cfif>
		</cfloop>
		<cfif TotalPages GT 0>
		  <tr>
		      <td colspan="4">
			      <cfloop index="Pages" from="0" to="#TotalPages#">
			         <cfset DisplayPgNo = Pages+1>
			         <cfif URL.PageIndex eq pages>
			            <strong>#DisplayPgNo#</strong>
			         <cfelse>
			            <a href="/cms/marketing/newsletter/viewnewsletter/?pageIndex=#Pages#">#DisplayPgNo#</a>
			         </cfif>
			         |
			      </cfloop>
		      </td>
	   	  </tr>
		</cfif>
	</table>
</cfif>
</cfoutput>
