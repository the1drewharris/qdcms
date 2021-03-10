<!--- 
	1. Validate Form
	2. Upload image file if it is there
	3. Add record to banner ad talbe
	4. Add record to renew ad table 
--->
 
<cfinclude template="validateform.cfm">
<cfif thereAreNoErrorsInForm>
	<cfif Trim(form.uploadfile) NEQ ''>
		<cfset destination = "/home/drew/domains/#client.siteurl#/public_html/ads/">
		<cfif not directoryExists(destination)>
			<cfdirectory action="create" directory="#destination#" mode="775">
		</cfif>
		<cffile action="upload" filefield="uploadfile" destination="#destination#" nameConflict="makeUnique">
		<cfinvoke component="#application.objimagegallery#" method="renameImage" oldImageName="#serverfile#" siteurl="#client.siteurl#" filepath="#destination#" destinationpath="#destination#" returnvariable="newfilename">
		<cfset form.image_path=newfilename>
	<cfelse>
		<cfset form.image_path="0">
	</cfif>
	
	<cfset form.admanagementdsn=client.siteurl>
	<cfset form.startdate=application.objtimedateconversion.dateToInt(form.startdate,form.starthour,startminute,form.startampm)>
	<cfset form.enddate=application.objtimedateconversion.dateToInt(form.enddate,form.endhour,form.endminute,form.endampm)>
	
	<cftransaction>
		<cfinvoke component="#application.objadmanagement#" method="addbannerad" returnvariable="adid" argumentcollection="#form#">
		<cfset form.adid=adid>
		<cfinvoke component="#application.objadmanagement#" method="renewAd" argumentcollection="#form#">
	</cftransaction>
	<cfinclude template="/actions/tracking.cfm">
	<cflocation url="/cms/marketing/admanagement/showadvertisement/?zoneid=#form.zoneid#" addtoken="false">
<cfelse>
	<cflocation url="#CGI.HTTP_REFERER#" addtoken="false">
</cfif>