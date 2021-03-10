<cfinclude template="validatealbumform.cfm">
<cfif thereAreNoErrorsInForm>
	<cfset args=StructNew()>
	<cfset args.videodsn=client.siteurl>
	<cfset args.newcategory=form.category>
	<cfset args.videocategoryid=form.videocategoryid>
	<cfinvoke component="#application.objvideolib#" method="editCategory" argumentcollection="#args#">
	<cfinclude template="/actions/tracking.cfm">
</cfif>
<cflocation url="/cms/#url.section#/#url.module#/showvideoalbums" addtoken="false">