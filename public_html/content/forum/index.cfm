<cfswitch expression="#url.action#">
	<cfcase value="delete">
		<cfset request.stream="deleted a forum">
		<cfinclude template="/content/forum/actions/deleteforum.cfm">
	</cfcase>
	<cfcase value="deleteposts">
		<cfset request.stream="deleted post(s)">
		<cfinclude template="/content/forum/actions/deleteposts.cfm">
	</cfcase>
	<cfcase value="approveposts">
		<cfset request.stream="approved post(s)">
		<cfinclude template="/content/forum/actions/approveposts.cfm">
	</cfcase>
	<cfcase value="deletetopics">
		<cfset request.stream="deleted topics">
		<cfinclude template="/content/forum/actions/deletetopics.cfm">
	</cfcase>
	<cfcase value="restoreforums,restoretopics,restoreposts">
		<cfset request.stream="restored something">
		<cfinclude template="/content/forum/actions/restore.cfm">
	</cfcase>
	<cfcase value="movetoforum,movetopicstoforum,movepoststotopic">
		<cfset request.stream="moved something">
		<cfinclude template="/content/forum/actions/moveto.cfm">
	</cfcase>
	<cfcase value="ignorereport">
		<cfset request.stream="ignored a report of a post">
		<cfinclude template="/content/forum/actions/ignorereport.cfm">
	</cfcase>
	<cfcase value="actionremovepostimage">
		<cfset request.stream="removed an image from a post">
		<cfinclude template="actions/removepostimage.cfm">
	</cfcase>
	<cfdefaultcase>
		<cfset request.stream=0>
		<cfinclude template="layout/default.cfm">
	</cfdefaultcase>
</cfswitch>