<cfparam name="url.s" default="">
<cfinvoke component="#application.objvideolib#" method="getVideos" videodsn="#client.siteurl#" criteria="#url.s#" status="Inactive" returnvariable="inactivevideos">
<cfoutput>
	<cfif inactivevideos.recordcount GT 0>
		<cfset searchAction="/cms/#url.section#/#url.module#/inactivevideos">
		<h1 class="left-hand-side">Inactive Videos</h1>
		<cfinclude template="../display/searchform.cfm">
		<table class="datagrid" id="managePagesTable">
			<tr class="titlebar">
				<th>Title</th>
				<th>Last Updated</th>
				<th>Last Viewed</th>
				<th>Preview</th>
				<th>Report</th>
				<th></th>
			</tr>
			<cfloop query="inactivevideos">
				<cfif currentRow MOD 2 EQ 0>
					<tr class="alt">
				<cfelse>
					<tr>
				</cfif>
				<td>#title#</td>
				<cfset ud=application.objtimedateconversion.convertdate(updatedon,'yyyy-mm-dd')>
				<cfset ut=application.objtimedateconversion.convertTime(updatedon,'hh:mmtt')>
				<td>#ud# #ut#</td>
				<cfset vd=application.objtimedateconversion.convertdate(lastviewed,'yyyy-mm-dd')>
				<cfset vt=application.objtimedateconversion.convertTime(lastviewed,'hh:mmtt')>
		  		<td>#vd# #vt#</td>
		  		<td><a href="/cms/#url.section#/#url.module#/watchvideo/?v=#vid#"><img src="#client.imagepath#/small/#imagepath#"></a></td>
				<td><a href="/cms/#url.section#/#url.module#/viewreport/?v=#vid#">View</a></td>
				<td><a href="/cms/#url.section#/#url.module#/actionactivatevideo/?v=#vid#">Activate</a></td>
				</tr>
			</cfloop>
		</table>
	<cfelse>
		<div class="quicknote">
			<h1>There are no inactive videos</h1>
		</div>
	</cfif>
</cfoutput>