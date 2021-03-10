<cfparam name="url.v" default="0">
<cfparam name="form.startdate" default="0">
<cfparam name="form.enddate" default="0">

<cfset title=Application.objvideolib.getVideoTitle(client.siteurl,url.v)>
<cfset args=StructNew()>
<cfset args.videodsn=client.siteurl>
<cfset args.vid=url.v>

<cfif form.startdate NEQ "0">
	<cfset args.startdate=application.objtimedateconversion.dateToInt(form.startdate,'00','00','AM')>
</cfif>
<cfif form.enddate NEQ "0">
	<cfset args.enddate=application.objtimedateconversion.dateToInt(form.enddate,'00','00','PM')>
</cfif>

<cfinvoke component="#application.objvideolib#" method="getViewCount" argumentcollection="#args#" returnvariable="viewCount">
<cfinvoke component="#application.objvideolib#" method="getUniqueViewCount" argumentcollection="#args#" returnvariable="uniqueViewCount">
<cfinvoke component="#application.objvideolib#" method="getViewPerDay" argumentcollection="#args#" returnvariable="ViewPerDay">
<cfinvoke component="#application.objvideolib#" method="getsamples" returnvariable="samples" argumentcollection="#args#">

<cfoutput>
	<div class="info">
		<h1>Report on #title#</h1>
		<h4>No of Times Played: #viewCount#</h4>
		<h4>Unique Listeners: #uniqueViewCount#</h4>
	</div>
	<cfif viewperday.recordcount GT 0>
		<cfchart format="jpg" chartwidth="910" yaxistitle="No of views" title="Views by day">
			<cfchartseries type="bar">
				<cfloop query="viewperday">
					<cfset d=application.objtimedateconversion.convertdate('#recordeddate#00000000')>
					<cfchartdata item="#d#" value="#totalviews#">
				</cfloop>
			</cfchartseries>
		</cfchart>
	</cfif>
	<div class="clear"><br /><br /></div>
	<cfif samples.recordcount GT 0>
		<cfif samples.recordcount GT 1>
			<cfset item='Samples'>
		<cfelse>
			<cfset item='Sample'>
		</cfif>
		<h1>Report on #item#</h1>
		<div class="clear"><br /><br /></div>
		
		<cfloop query="samples">
			<cfset args.vid=sampleid>
			<cfinvoke component="#application.objvideolib#" method="getViewCount" argumentcollection="#args#" returnvariable="viewCount">
			<cfinvoke component="#application.objvideolib#" method="getUniqueViewCount" argumentcollection="#args#" returnvariable="uniqueViewCount">
			<cfinvoke component="#application.objvideolib#" method="getViewPerDay" argumentcollection="#args#" returnvariable="ViewPerDay">
			<div class="info">
				<h3>#samplename#</h3>
				<h4>No of Times Played: #viewCount#</h4>
				<h4>Unique Listeners: #uniqueViewCount#</h4>
			</div>
			<cfif viewperday.recordcount GT 0>
				<cfchart format="jpg" chartwidth="910" yaxistitle="No of views" title="Views by day">
					<cfchartseries type="bar">
						<cfloop query="viewperday">
							<cfset d=application.objtimedateconversion.convertdate('#recordeddate#00000000')>
							<cfchartdata item="#d#" value="#totalviews#">
						</cfloop>
					</cfchartseries>
				</cfchart>
			</cfif>
			<div class="clear"><br /><br /></div>
		</cfloop>
	</cfif>
</cfoutput>