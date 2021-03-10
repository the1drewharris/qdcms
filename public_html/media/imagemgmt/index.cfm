<cfswitch expression="#url.action#">
	<cfcase value="actionaddalbum">
		<cfset request.stream="added an image album">
		<cfinclude template="actions/addalbum.cfm">
	</cfcase>
	<cfcase value="actioneditalbum">
		<cfset request.stream="edited an image album">
		<cfinclude template="actions/editalbum.cfm">
	</cfcase>
	<cfcase value="actiondelete">
		<cfset request.stream="deleted image(s)">
		<cfinclude template="actions/deleteimages.cfm">
	</cfcase>
	<cfcase value="actiondeletealbums">
		<cfset request.stream="deleted image album(s)">
		<cfinclude template="actions/deletealbums.cfm">
	</cfcase>
	<cfcase value="actionremove">
		<cfset request.stream="removed image(s) from an album">
		<cfinclude template="actions/removeimages.cfm">
	</cfcase>
	<cfcase value="actioncopytoalbums">
		<cfset request.stream="copied image(s) to album(s)">
		<cfinclude template="actions/copytoalbums.cfm">
	</cfcase>
	<cfcase value="actionsortalbums">
		<cfset request.stream="sorted an image album">
		<cfinclude template="actions/sortalbums.cfm">
	</cfcase>
	<cfcase value="actionsort">
		<cfset request.stream="sorted images within an image album">
		<cfinclude template="actions/sortimages.cfm">
	</cfcase>
	<cfcase value="actionsetstatus">
		<cfset request.stream="changed the status of an image">
		<cfinclude template="actions/setimagestatus.cfm">
	</cfcase> 
	<cfcase value="actionupload">
		<cfset request.stream="uploaded image(s)">
		<cfinclude template="actions/uploadimage.cfm">
	</cfcase>
	<cfcase value="actionpending">
		<cfset request.stream="approved or deleted pending images">
		<cfinclude template="actions/pendingimages.cfm">
	</cfcase>
	<cfcase value="actioneditimage">
		<cfset request.stream="edited an image">
		<cfinclude template="actions/editimage.cfm">
	</cfcase>
	<cfcase value="actionrotateimage">
		<cfset request.stream="rotated an image">
		<cfinclude template="actions/rotateimage.cfm">
	</cfcase>
	<cfdefaultcase>
		<cfset request.stream=0>
		<cfinclude template="layout/default.cfm">
	</cfdefaultcase>
</cfswitch>