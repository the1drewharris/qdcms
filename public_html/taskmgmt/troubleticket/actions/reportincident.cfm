<cfoutput>
	<cfinclude template="validateform.cfm">
	<cfparam name="form.screenshot" default="">
	<cfif thereAreNoErrorsInForm>
		<cfinvoke component="#application.abCFC#" contactdsn="#application.masterdsn#" method="getContactviaNameid" nameid="#client.masternameid#" returnvariable="contactinfo">
		<cftransaction>
			<cfif form.screenshot NEQ "">
				<cfset destination="/home/drew/domains/#thissite#/public_html/troubleticket_screenshots/">
				<cffile action="upload" filefield="screenshot" accept="image/jpg, image/jpeg, image/gif, image/png" destination="#destination#" nameConflict="makeUnique">
				<cfset args.incidentdsn=thissite>
				<cfset args.screenshotname=serverfile>
				<cfset args.nameid=client.masternameid>
				<cfinvoke component="#application.objincident#" method="addscreenshot" argumentcollection="#args#" returnvariable="screenshotid">
				<cfset form.screenshotid=screenshotid>
			</cfif>
			<cfset form.incidentdsn=thissite>
			<cfset form.nameid=client.masternameid>
			<cfset form.siteid=client.siteid>
			<cfset form.incidentname = "INCIDENT-#client.siteurl#-#Application.objtimedateconversion.createtimedate()#">
			<cfinvoke component="#application.objincident#" method="recordIncident" argumentcollection="#form#">
			<cfsavecontent variable="incidentreport">
				Incident has been reported by #client.firstname# #client.lastname# of #client.siteurl# at #now()# <br /><br />
				Here is the short detail <br /><br />
				<cfif form.incidenturl NEQ ''>
				<b>Incident URL</b>: #form.incidenturl# <br /> <br />
				</cfif>
				<b>Error Description</b>
				#form.incidentdescription#
			</cfsavecontent>
			<cfmail to="support@quantumdelta.com" from="support@quantumdelta.com" subject="Incident Report" type="html">
				#incidentreport#
			</cfmail>
			<cfset useremail="">
			<cfif Trim(contactInfo.wemail) NEQ "">
				<cfset useremail=contactInfo.wemail>
			<cfelseif Trim(contactInfo.hemail) NEQ "">
				<cfset useremail=contactInfo.hemail>
			<cfelseif Trim(contactInfo.memail) NEQ "">
				<cfset useremail=contactInfo.memail>
			<cfelseif Trim(contactInfo.oemail) NEQ "">
				<cfset useremail=contactInfo.oemail>
			</cfif>
			<cfset yourname="#contactInfo.firstname# #contactInfo.lastname#">
			<cfset yourname=Trim(yourname)>
			<cfsavecontent variable="emailtouser">
				<cfif len(yourname)>
					Dear #yourname#,<br />
					Thank you for submitting the incident. Quantum Delta support staff has been notified of the incident and will be in touch with you
					throughout the process. <br /><br />
					
					Thank you <br />
					support@quantumdelta.com
				</cfif>
			</cfsavecontent>
			<cfif len(useremail)>
				<cfmail to="#useremail#" from="support@quantumdelta.com" subject="Incident Reported" type="html">
					#emailtouser#	
				</cfmail>	
			</cfif>
		</cftransaction>
		<cflocation url="/cms/taskmgmt/troubleticket/showincidents" addtoken="false">
	<cfelse>
		<cflocation url="#CGI.HTTP_REFERER#" addtoken="false">
	</cfif>
</cfoutput>