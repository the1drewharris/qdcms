<cfparam name="url.c" default="0">
<cfparam name="url.k" default="0">
<cfif listfindnocase("showevents,listevents",url.action) GT 0> 
<cfoutput>
	<cfinvoke component="#application.objevent#" method="getCategories" eventdsn="#client.siteurl#" returnVariable="categories">
	<div class="searchbox" style="float:right">
		<form method="get" action="/cms/crm/events/listevents">
			<table border="0">
			<tr>
				<td>Select Category
					<select name="c" id="eventcatid">
						<option value="0">All Events</op>
						<cfloop query="categories">
						<option value="#eventcategoryid#" <cfif url.c EQ eventcategoryid>Selected</cfif>>#eventcategory#</option>
						</cfloop>
					</select> &nbsp;&nbsp;&nbsp;&nbsp;
				</td>
				<td>
					Search Event&nbsp;&nbsp;&nbsp;<input type="text" name="k" <cfif url.k NEQ 0>value="#url.k#"</cfif>>
					<input type="submit" value="Search">
				</td>
			</tr>
			</table>
		</form>
	</div> 
	<div class="clear"></div><br />
</cfoutput>
</cfif>