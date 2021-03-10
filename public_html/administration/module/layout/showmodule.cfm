<cfparam name="url.sectionid" default="0">
<h1 style="float: left;">Modules</h1>
<span style="float: left; margin: 10px 0 0 10px">
	<a href="" id="delete" title="Delete checked Entries">Delete</a>
</span>
<div class="clear"></div>

<table class="datagrid" id="managePagesTable">
	<tr class="titlebar">
		<th class="checkbox"><input id="selectAll" type="checkbox" /></th>
		<th>Module</th>
		<th>Caption</th>
		<th>Description</th>
	</tr>
	<cfinvoke component="#application.objqdsecurity#" method="getQdModules" sectionid="#url.sectionid#" returnvariable="allModules">
	<cfoutput query="allmodules">
		<tr>
			<td><input type="checkbox" id="module#moduleid#" /></td>
			<td>
				<a href="/cms/administration/module/editmodule/?moduleid=#moduleid#" class="name" title="Edit &quot;#module_name#&quot;"> 
					<cfif Trim(module_name) NEQ "">#module_name#<cfelse><i>No Name</i></cfif>
				</a>
			</td>
			<td>#caption#</td>
			<td>#description#</td>
		</tr>
	</cfoutput>
</table>