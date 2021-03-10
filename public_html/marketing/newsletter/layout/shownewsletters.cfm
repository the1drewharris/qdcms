<cfoutput>
	<cfparam name="url.s" default="0">
	<cfset perPage=15>
	<cfif NOT isNumeric(url.s)>
		<cflocation url="/cms/marketing/newsletter/shownewsletters" addtoken="false">
	</cfif>
	<cfinvoke component="#application.objnewsletter#" method="getNewsletterCount" ds="#client.siteurl#" returnvariable="noofnewsletters">
	<cfinvoke component="#application.objnewsletter#" method="getNewsletterHeaders" ds="#client.siteurl#" startvalue="#url.s#" recordsperpage="#perPage#" returnVariable="getMyNewsletter">
	<cfif NOT getMyNewsletter.recordCount>
		<div class="quicknote">
			<h1>There are currently no Newsletters for this site. 
			<a href="/cms/marketing/newsletter/addNewsletter">Click here</a> to add your first Newsletter!</h1>
			<p>It is really easy, plus every site needs at least one Newsletter!</p>
		</div>	
	<cfelse>
		<h1 style="float: left;">Newsletter</h1>
		<span style="float: left; margin: 10px 0 0 10px">
			<a href="" id="copy" title="Copy checked Newsletter">Copy</a> 
			<a href="" id="delete" title="Delete checked Newsletter">Delete</a>
		</span>
		
		<span style="float: right; margin: 10px 10px 0 10px">
			<table>
				<tr>
					<form id="form" method="post" action="/cms/marketing/newsletter/shownewsletters">
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
		<table class="datagrid" id="managePagesTable">
			<tr class="titlebar">
				<th class="checkbox"><input id="selectAll" type="checkbox" /></th>
				<th>Name</th>
				<th>Subject</th>
				<th>Created on</th>
				<th>Last Updated</th>
				<th>Status</th>
				<th Align="center">View Report</th>
			</tr>
			<cfloop query="getMyNewsletter">
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
				
				<cfset createddate=application.objtimedateconversion.convertDate(Createdon,"mm/dd/yyyy")>
				<cfset createdtime=application.objtimedateconversion.convertTime(Createdon,"hh:mmtt")>
					
		  		<td>#createddate# #createdtime#</td>
		  		
	  			<cfset updateddate=application.objtimedateconversion.convertDate(updatedon,"mm/dd/yyyy")>
				<cfset updatedtime=application.objtimedateconversion.convertTime(updatedon,"hh:mmtt")>
				
				<td>#updateddate# #updatedtime#</td>
				<td><cfif sent EQ '1'>Sent<cfelseif sent EQ '2'>Sending<cfelse>Not Sent</cfif></td>
				<td align="center"><a href="/cms/marketing/newsletter/viewreport/?newsletterid=#newsletterid#">View</a></td></tr>
			</cfloop>
			<cfif noofnewsletters GT perPage>
			<tr>
				<td colspan="6">
					<cfset args=StructNew()>
					<cfset args.prefixURL="/cms/marketing/newsletter/shownewsletters/?s=">
					<cfset args.rowLabel="Newsletters">
					<cfset args.perPage=perPage>
					<cfset args.totalRows=noofnewsletters>
					<cfset args.delimeter="&bull">
					<cfset args.currentValue=url.s>
					<cfinvoke component="#application.objpagination#" method="get" argumentcollection="#args#" returnvariable="pagination">
					#pagination#
				</td>
			</tr>
			</cfif>
		</table>
	</cfif>
</cfoutput>