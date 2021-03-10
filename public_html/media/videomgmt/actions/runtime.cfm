<cfparam name="url.vid" default="0">
<cfparam name="url.rt" default="0">
<cfset runtime=0>
<cfif isNumeric(url.rt)>
	<cfif url.rt GT 0>
		<cfset runtime=ceiling(url.rt)>
	</cfif>
</cfif>

<cfif isNumeric(url.vid)>
	<cfif url.vid GT 0>
		<cfif runtime GT 0>
			<cfset application.objvideolib.addRunTime(client.siteurl,url.vid,runtime)>
		</cfif>
	</cfif>
</cfif>