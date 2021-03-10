<cfparam name="url.n" default="0">
<cfparam name="url.ds" default="0">
<cfset inabatch="2">
<cfset taskname="#url.ds#-#url.n#">
<cfobject component="newsletter" name="objnewsltr">
<cfset v=objnewsltr.isValidNewsletter(url.ds,url.n)>
<cfif (v EQ 0) OR (v EQ 2)>
	<cfif v EQ 0>
		<cfset objnewsltr.setAsBeingSent(url.ds,url.n)>
	</cfif>
	<cfset thereAreMore=objnewsltr.sendNewsletterInBatch(url.ds,url.n,inabatch,url.fromaddress)>
	<cfif NOT thereAreMore>
		<cfset objnewsltr.setAsSent(url.ds,url.n)>
		<cfschedule action="delete" task="#taskname#">
	</cfif>
</cfif>