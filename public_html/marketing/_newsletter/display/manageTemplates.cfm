<!--- CFINVOKE to Get Published and Draft Pages --->

<cfinvoke component="#application.objnewsletter#" method="getTemplate" ds="#client.siteurl#" returnVariable="templates">
<script type="text/javascript" src="/js/lib/marketing/newsletter/default.js"></script>
<cfoutput>
<cfif NOT templates.recordCount>
	<div class="quicknote">
		<h1>No Newsletter Template found. 
		<a href="/cms/marketing/newsletter/addtemplate/">Click here</a> to add New Newsletter Template!</h1>
	</div>	
<cfelse>
	<cfparam name="client.quicknote" default="">

	<cfif len(client.quicknote)>
		<cfoutput>#client.quicknote#</cfoutput>
		<cfset client.quicknote = "">
	</cfif>
		<h1 style="float: left;">Manage Newsletter Templates</h1>
		<span style="float: left; margin: 10px 0 0 10px">
			<a href="" id="copyTemplate" title="Copy checked Templates">Copy</a>
			<a href="" id="deleteTemplate" title="Delete checked Templates">Delete</a>
		</span>
		<div class="clear"> </div>
	
	<table class="datagrid" id="managePagesTable">
		<tr class="titlebar">
			<th class="checkbox"><input id="selectAll" type="checkbox" /></th>
			<th>Title</th>
			<th>Description</th>
			<th>Status</th>
			<th> </th>
		</tr>
		<cfloop query="templates">
		<cfif currentRow MOD 2 EQ 0>
			<cfif status EQ 'Deactive'>
				<tr class="alt-deleted">
			<cfelse>
				<tr class="alt">
			</cfif>
		<cfelse>
			<cfif status EQ 'Deactive'>
				<tr class="deleted">
			<cfelse>
				<tr>
			</cfif>
		</cfif>
			<td><input type="checkbox" id="newsletter#newslettertemplateid#" /></td>
			<td><a href="/cms/marketing/newsletter/editTemplate/?newslettertemplateid=#newslettertemplateid#">#name#</a></td>
			<td>#description#</td>
			<td>#status#</td>
			<td><cfif status EQ 'Deactive'><a href="/cms/marketing/newsletter/restoreTemplate/?newslettertemplateid=#newslettertemplateid#">Restore</a></cfif></td>
		</tr>
		</cfloop>
	</table>
</cfif>
</cfoutput>