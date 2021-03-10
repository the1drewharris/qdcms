<cfinclude template="validateform.cfm">
<cfset args=StructNew()>
<cfset args.haudsn=client.siteurl>
<cfset args.aboutusparentid="-1">

<cfif thereAreNoErrorsInForm>
	<cfset myparent=application.objhau.getparent(client.siteurl,form.aboutusid)>
	<cfif myparent NEQ form.aboutusparentid>
		<cfset args.aboutusparentid=form.aboutusparentid>
	</cfif>
	<cfset args.aboutusid=form.aboutusid>
	<cfset args.aboutus=form.aboutus>	
	<cfset args.status=form.status>
	<cftransaction>
		<cfinvoke component="#application.objhau#" method="updatehauoption" argumentcollection="#args#">
	</cftransaction>
	<cfset client.message="Heard About Us option updated">
	<cfinclude template="/actions/tracking.cfm">
	<cflocation url="/cms/marketing/heardaboutus/showhauoptions" addtoken="false">
<cfelse>
	<cflocation url="#CGI.HTTP_REFERER#" addtoken="false">
</cfif>