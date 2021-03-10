<cfset taskname="#client.siteurl#-#newsletterid#">
<cfset urlpath="http://#application.dsn#/marketing/newsletter/actions/sendnewsletter.cfm?ds=#client.siteurl#&n=#newsletterid#&fromaddress=#client.username#">
<cfset startdate=application.objtimedateconversion.convertDate(strdate)>
<cfset starttime=application.objtimedateconversion.convertTime(strdate,'hh:mmtt')>
<cfschedule action="update" operation="HTTPrequest" task="#taskname#" url="#urlpath#" startdate="#startdate#" starttime="#starttime#" interval="180">
<cfif form.sendnow EQ 1>
	<cfset url.fromaddress=client.username>
	<cfset url.n=newsletterid>
	<cfset url.ds=client.siteurl>
	<cfinclude template="sendnewsletter.cfm">
</cfif>