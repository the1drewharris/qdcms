<!--- 
	Date: 2011-01-05
	Objective: To add postimage table to the forum. It would allow us to upload and associate images to a forum topic or post
	Description: SQL to add POSTIMAGE table was added to createForumTables method in buildtables CFC.
				 Function invoked to add a image gallery named Classified 	
--->
<cfset ds=client.siteurl>
<cfset upgradeWasSuccessful=TRUE>
<cftry>
	<cftransaction>
		<cfinvoke component="#application.objbuildtables#" method="createForumTables" ds="#ds#">
		<cfinvoke component="#application.objimagegallery#" method="addGallery" imagedsn="#ds#" galleryname="Forum" status="Private">	
	</cftransaction>
	<cfcatch type="any">
		<cfset client.message="Patch upgrade forum 1 could not be applied due to error: #cfcatch.message#">
		<cfset upgradeWasSuccessful=FALSE>
	</cfcatch>
</cftry>