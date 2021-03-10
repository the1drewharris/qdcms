<cfinclude template="validatenotesform.cfm">
<cfif thereAreNoErrorsInForm>
	<cfparam name="client.referer" default="/cms/#url.section#/#url.module#/showcontacts">
	<cftransaction>
		<cfinvoke component="#application.objcomments#" method="addComment" ds="#client.siteurl#" userid="#client.masternameid#" argumentcollection="#form#" returnvariable="commentid">
	</cftransaction>
	<cfif Trim(form.to) NEQ ''>
		<cfinvoke component="#application.objcomments#" method="outputComment" commentid="#commentid#" ds="#client.siteurl#" returnvariable="myOutComment">
		<cfmail to="#form.to#" from="#client.firstname# #client.lastname# <#client.username#>" subject="Comment Added" type="html">
			#ReReplace(myOutComment,chr(10),"<br />","All")#
		</cfmail>
	</cfif>
	<cfset client.message="Comment has been added to the contact">
	<cfinclude template="/actions/tracking.cfm">
	<cflocation url="#client.referer#" addtoken="false">
<cfelse>
	<cfset client.message="Please correct the following errors">
</cfif>
<cflocation url="#CGI.HTTP_REFERER#" addtoken="false">