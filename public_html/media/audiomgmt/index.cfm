<cfswitch expression="#url.action#">
	<cfcase value="actionsortalbums">
		<cfset request.stream="sort audio albums">
		<cfinclude template="actions/sortalbums.cfm">
	</cfcase>
	<cfcase value="actionsort">
		<cfset request.stream="sort audio files">
		<cfinclude template="actions/sortaudios.cfm">
	</cfcase>
	<cfcase value="actionremove">
		<cfset request.stream="removed audio files">
		<cfinclude template="actions/removeaudios.cfm">
	</cfcase>
	<cfcase value="actiondeletealbums">
		<cfset request.stream="deleted audio albums">
		<cfinclude template="actions/deletealbums.cfm">
	</cfcase>
	<cfcase value="actioncopytoalbums">
		<cfset request.stream="copied audio files to other album(s)">
		<cfinclude template="actions/copytoalbums.cfm">
	</cfcase>
	<cfcase value="actionsetstatus">
		<cfset request.stream="set the status of an audio file">
		<cfinclude template="actions/setstatus.cfm">
	</cfcase>
	<cfcase value="actiondelete">
		<cfset request.stream="deleted audio files">
		<cfinclude template="actions/deleteaudios.cfm">
	</cfcase>
	<cfcase value="actionaddalbum">
		<cfset request.stream="added an audio album">
		<cfinclude template="actions/addalbum.cfm">
	</cfcase>
	<cfcase value="actioneditalbum">
		<cfset request.stream="edited an audio album">
		<cfinclude template="actions/editalbum.cfm">
	</cfcase>
	<cfcase value="actionactivate">
		<cfset request.stream="activated an audio file">
		<cfinclude template="actions/activate.cfm">
	</cfcase>
	<cfcase value="actionaddfile">
		<cfset request.stream="added an audio file">
		<cfinclude template="actions/addfile.cfm">
	</cfcase>
	<cfcase value="actionaddaudio">
		<cfset request.stream="added an audio file">
		<cfinclude template="actions/addaudio.cfm">
	</cfcase>
	<cfcase value="actioneditaudio">
		<cfset request.stream="edited an audio file">
		<cfinclude template="actions/editaudio.cfm">
	</cfcase>
	<cfdefaultcase>
		<cfinclude template="layout/default.cfm">
	</cfdefaultcase>
</cfswitch>