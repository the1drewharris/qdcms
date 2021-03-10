<cfinvoke component="#Application.objcontest#" method="getContest" returnvariable="thiscontest" contestdsn="#client.siteurl#" contestid="#url.contestid#">
<cfinvoke component="#Application.objcontest#" method="getentries" returnvariable="entries" contestdsn="#client.siteurl#" contestid="#url.contestid#">
<cfif entries.recordcount gt 0>
<table class="datagrid" width="910">
	<tr class="titlebar">
		<th width="50">SN</th>
		<th>Name </th>
		<cfif thiscontest.answerrequired EQ 1>
		<th>Entry Text</th>
		</cfif>
		<cfif thiscontest.imagerequired EQ 1>
		<th>Image</th>
		</cfif>
		<cfif thiscontest.videorequired EQ 1>
		<th>Video</th>
		</cfif>
		<th>Winner</th>
	</tr>
	<tbody>
		<cfset sn=1>
		<cfoutput query="entries">
			<tr>
				<td>#sn#</td>
				<td><a href="mailto:#wemail#">#firstname# #lastname#</a></td>
				<cfif thiscontest.answerrequired EQ 1>
				<td>#entrytext#</td>
				</cfif>
				<cfif thiscontest.imagerequired EQ 1>
				<cfinvoke component="imagegallery" method="getimage" imagedsn="#client.siteurl#" imageid="#imageid#" returnvariable="myimage">
				<td><img src="/images/tiny/imagepath"></td>
				</cfif>
				<cfif thiscontest.videorequired EQ 1>
					<a href="">View Video</a>
				</cfif>
				<td>
					<cfinvoke component="#Application.objcontest#" method="isWinner" returnvariable="winner" contestdsn="#client.siteurl#" contestid="#url.contestid#" nameid="#nameid#">
					<cfif not winner>
						<a href="/cms/content/contest/selectwinner?contestid=#url.contestid#&nameid=#nameid#">Pick as winner</a>
					<cfelse>
						Contest Winner	
					</cfif>
				</td>
			</tr>
			<cfset sn=sn+1>
		</cfoutput>
	</tbody>
</table>
<cfelse>
	No entries for this contest
</cfif>