<h1 style="float: left;">Sections</h1>
<span style="float: left; margin: 10px 0 0 10px">
	<a href="" id="delete" title="Delete checked Entries">Delete</a>
</span>
<div class="clear"></div>
<cfinvoke component="#application.objqdsecurity#" method="getQdSections" returnvariable="allsections">
<table class="datagrid" id="managePagesTable">
	<tr class="titlebar">
		<th class="checkbox"><input id="selectAll" type="checkbox" /></th>
		<th>Section</th>
		<th>Description</th>
		<th></th>
	</tr>
	<cfoutput query="allsections">
		<tr>
			<td><input type="checkbox" id="section#sectionid#" /></td>
			<td>
				<a href="/cms/administration/section/editsection/?sectionid=#sectionid#" class="name" title="Edit &quot;#section_name#&quot;"> 
					<cfif Trim(section_name) NEQ "">#section_name#<cfelse><i>No Name</i></cfif>
				</a>
			</td>
			<td>#description#</td>
			<td><a href="/cms/#url.section#/#url.module#/sortmodules/?s=#sectionid#">Sort Modules</a></td>
		</tr>
	</cfoutput>
</table>