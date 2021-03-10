<!--- updated on 2009020908140000 by binod@quantumdelta.com --->
<cfparam name="form.startdate" default="0">
<cfparam name="form.enddate" default="0">
<cfset args=Structnew()>
<cfset args.admanagementdsn=Client.siteurl>
<cfset args.adid=url.adid>

<cfif Trim(form.startdate) EQ "">
	<cfset form.startdate="0">
</cfif>
<cfif Trim(form.enddate) EQ "">
	<cfset form.enddate="0">
</cfif>
<cfoutput>
	<cfif form.startdate NEQ "0">
		Start Date: #form.startdate# <br />
		<cfinvoke component="#application.objtimedateconversion#" method="dateToInt" date="#form.startdate#" hours="00" minutes="00" ampm="am" returnvariable="startdate">
		<cfset args.startdate=startdate>
	</cfif>
	<cfif form.enddate NEQ "0">
		End Date: #form.enddate# <br />
		<cfinvoke component="#application.objtimedateconversion#" method="dateToInt" date="#form.enddate#" hours="00" minutes="00" ampm="am" returnvariable="enddate">
		<cfset args.enddate=enddate>
	</cfif>
	<cfinvoke component="#application.objadmanagement#" method="getImpressions" returnvariable="impressions" argumentcollection="#args#">
	<b>No of Impressions</b>: #impressions.noofimpressions#<br />
	<b>No of Unique Impressions</b>:#impressions.noofuniqueimpressions#<br />
	<b>No of Clicks</b>:#impressions.noofclicks#<br /><br />
	<cfinvoke component="#application.objadmanagement#" method="getImpressionsPerDay" argumentcollection="#args#" returnvariable="impressionsPerDay">

	<cfif 30 GT impressionsPerDay.recordCount>
		<cfset loopNumber = 30 - #impressionsPerDay.recordCount#>
	<cfelse>
		<cfset loopNumber = 0>
	</cfif>
	<div style="float:right">
		<form method="post" action="/cms/marketing/admanagement/showimpressions/?adid=#url.adid#">
			<label for="startdate">Start Date
				<input id="startdate" name="startdate" rel="actual" type="text" />
			</label>
			<label for="enddate">End Date
				<input id="enddate" name="enddate" value="#DateFormat(Now(), "mm/dd/yyyy")#" rel="actual" type="text" />
			</label>
			<input type="submit" value="submit">
		</form>
	</div>
	<p>
	<cfchart show3D="no" tipStyle="mouseOver" chartWidth="910" xaxistitle="Date" yaxistitle="No. of Clicks" title="Clicks By Day">
		<cfchartseries type="line" >
			<cfloop query="impressionsPerDay">
				<cfset date = "#impressiondate#">
				<cfchartdata item="#application.objtimedateconversion.convertDate(date,"mmm-dd")#" value="#noofclicks#">
			</cfloop>
		</cfchartseries>
	</cfchart>
	<cfchart show3D="no" tipStyle="mouseOver" chartWidth="910" xaxistitle="Date" yaxistitle="No. of Impressions" title="Impressions By Day">
		<cfchartseries type="line">
			<cfloop query="impressionsPerDay">
				<cfset date = "#impressiondate#">
				<cfchartdata item="#application.objtimedateconversion.convertDate(date,"mmm-dd")#" value="#noofimpressions#">
			</cfloop>
		</cfchartseries>
	</cfchart>
	</p>
</cfoutput>