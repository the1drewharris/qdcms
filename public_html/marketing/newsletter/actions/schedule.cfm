<cfset taskname="#client.siteurl#-#newsletterid#">
<cfset urlpath="http://#application.dsn#/marketing/newsletter/actions/sendnewsletter.cfm?ds=#client.siteurl#&n=#newsletterid#&fromaddress=#client.username#">
<cfset startdate=application.objtimedateconversion.convertDate(strdate)>
<cfset starttime=application.objtimedateconversion.convertTime(strdate,'hh:mmtt')>
<cfschedule action="update" operation="HTTPrequest" task="#taskname#" url="#urlpath#" startdate="#startdate#" starttime="#starttime#" interval="180">