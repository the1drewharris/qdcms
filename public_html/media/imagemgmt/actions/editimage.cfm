<cfinclude template="validateeditimageform.cfm">
<cfif thereAreNoErrorsInForm>
	<cfset form.imagedsn=client.siteurl>
	<cfset form.userid=client.masternameid>
	<cfinvoke component="#application.objimagegallery#" method="updateImage" argumentcollection="#form#" createstandardthumbs="no">
</cfif>
<cfinclude template="/actions/tracking.cfm">
<cflocation url="#client.editImageReturnPath#" addtoken="false">