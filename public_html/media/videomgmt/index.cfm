<cfswitch expression="#url.action#">
	<cfcase value="actionaddvideoalbum">
		<cfset request.stream="added a video album">
		<cfinclude template="actions/addvideoalbum.cfm">
	</cfcase>
	<cfcase value="actioneditvideoalbum">
		<cfset request.stream="edited a video album">
		<cfinclude template="actions/editvideoalbum.cfm">
	</cfcase>
	<cfcase value="actionaddvideo">
		<cfset request.stream="added/updated a video">
		<cfinclude template="actions/addvideo.cfm">
	</cfcase>
	<cfcase value="actioneditvideo">
		<cfset request.stream="edited a video">
		<cfinclude template="actions/editvideo.cfm">
	</cfcase>
	<cfcase value="actionsortalbums">
		<cfset request.stream="sorted video albums">
		<cfinclude template="actions/sortvideoalbums.cfm">
	</cfcase>
	<cfcase value="actiondeletealbums">
		<cfset request.stream="deleted video album(s)">
		<cfinclude template="actions/deletevideoalbums.cfm">
	</cfcase>
	<cfcase value="actionsort">
		<cfset request.stream="sorted videos within a video album">
		<cfinclude template="actions/sortvideos.cfm">
	</cfcase>
	<cfcase value="actioncopytoalbums">
		<cfset request.stream="copied video(s) to other album(s)">
		<cfinclude template="actions/copytoalbums.cfm">
	</cfcase>
	<cfcase value="actionremove">
		<cfset request.stream="removed video(s) from an album">
		<cfinclude template="actions/removevideos.cfm">
	</cfcase>
	<cfcase value="actionsetstatus">
		<cfset request.stream="changed the status of a video">
		<cfinclude template="actions/setstatus.cfm">
	</cfcase>
	<cfcase value="actiondelete">
		<cfset request.stream="deleted videos">
		<cfinclude template="actions/deletevideos.cfm">
	</cfcase>
	<cfcase value="actionaddfile">
		<cfset request.stream="added a file to a video">
		<cfinclude template="actions/addfile.cfm">
	</cfcase>
	<cfcase value="actionactivatevideo">
		<cfset request.stream="activated a video">
		<cfinclude template="actions/activatevideo.cfm">
	</cfcase>
	<cfdefaultcase>
		<cfset request.stream=0>
		<cfinclude template="layout/default.cfm">
	</cfdefaultcase>
</cfswitch>