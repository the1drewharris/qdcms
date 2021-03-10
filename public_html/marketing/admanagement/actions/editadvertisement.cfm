<cfinclude template="validateform.cfm">
<cfif thereAreNoErrorsInForm>
	<cfif Trim(form.uploadfile) NEQ "">
		<cfset destination = "/home/drew/domains/#client.siteurl#/public_html/ads/">
		<cffile action="upload" filefield="uploadfile" destination="#destination#" nameConflict="makeUnique">
		<cfinvoke component="imagegallery" method="renameImage" oldImageName="#serverfile#" siteurl="#client.siteurl#" filepath="#destination#" destinationpath="#destination#" returnvariable="newfilename">
		<cfset image_path=newfilename>
	<cfelse>
		<cfset image_path="0">
	</cfif>
	<cfset form.admanagementdsn=client.siteurl>
	<cfset form.startdate=application.objtimedateconversion.dateToInt(form.startdate,form.starthour,startminute,form.startampm)>
	<cfset form.enddate=application.objtimedateconversion.dateToInt(form.enddate,form.endhour,form.endminute,form.endampm)>
	<cftransaction>
		<cfinvoke component="#application.objadmanagement#" method="editbannerad" argumentcollection="#form#">
		<cfinvoke component="#application.objadmanagement#" method="editrenewad" argumentcollection="#form#">
	</cftransaction>
	<cfinclude template="/actions/tracking.cfm">
	<cflocation url="/cms/marketing/admanagement/showadvertisements/zoneid=#form.zoneid#">
<cfelse>
	<cflocation url="#CGI.HTTP_REFERER#" addtoken="false">
</cfif>