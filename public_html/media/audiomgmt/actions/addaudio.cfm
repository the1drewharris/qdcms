<cfinclude template="validateaudioform.cfm">
<cfif thereAreNoErrorsInForm>
	<cfset sampleIsUploaded=FALSE>
	<cfinclude template="createdirectories.cfm">
	<cftry>
		<cffile action="upload" filefield="video" destination="#destination#" nameconflict="makeUnique" result="uploadedAudioFile">
		<cfset audiofile=application.objimagegallery.renamefile(destination,uploadedAudioFile.serverFile,uploadedAudioFile.serverFileExt)>
		
		<cfif Trim(form.sample) NEQ "">
			<cffile action="upload" filefield="sample" destination="#sampleDestination#" nameconflict="makeUnique" result="uploadedSampleFile">
			<cfset samplefile=application.objimagegallery.renamefile(sampleDestination,uploadedSampleFile.serverFile,uploadedSampleFile.serverFileExt)>
			<cfset sampleIsUploaded=TRUE>
		</cfif>
		
		<cftransaction>
			<cfset id=application.objproduct.createID(client.siteurl,'Media',form.title,1,0)>
			<cfset application.objvideolib.addVideo(client.siteurl,id,form.title,audiofile,form.keywords,0,form.link,'',form.status,'','',form.summary,form.description,form.caption,2)>
			<cfset application.objvideolib.videoToCategory(client.siteurl,id,form.videocategoryid)>
			<cfif form.subscriableproduct EQ 1>
				<cfinclude template="addsubscriableproduct.cfm">
			</cfif>
		</cftransaction>
		<cfinclude template="/actions/tracking.cfm">
		<cfcatch type="any">
			<cfset client.message="The request could not be completed because of error. #cfcatch.message#">
		</cfcatch>
	</cftry>
	<cflocation url="/cms/#url.section#/#url.module#/viewalbum/?id=#form.videocategoryid#" addtoken="false">
<cfelse>
	<cflocation url="#CGI.HTTP_REFERER#" addtoken="false">
</cfif>