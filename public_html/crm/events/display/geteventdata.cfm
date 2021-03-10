<cfparam name="url.m" default="08">
<cfparam name="url.d" default="01">
<cfparam name="url.y" default="2010">
<cfparam name="url.c" default="0">

<cfset start="#url.y##url.m##url.d#00000000">
<cfset end="#url.y##url.m#3123599999">
<cfinvoke component="#Application.objEvent#" method="getAllEvents" eventdsn="#client.siteurl#" category="#url.c#" start="#start#" end="#end#" status="All" returnvariable="allevents">

[
	<cfoutput query="allevents">
		<cfset s = "#application.objtimedateconversion.convertDate(starttime,'yyyy-mm-dd')#">
		<cfset e = "#application.objtimedateconversion.convertDate(endtime,'yyyy-mm-dd')#">
	{
		"id": "#eventinstanceid#",
		"title": "#JSStringFormat(eventname)#",
		"start": "#s#",
		"end": "#e#"
	}<cfif currentRow LT recordCount >,</cfif>
	</cfoutput>
]
