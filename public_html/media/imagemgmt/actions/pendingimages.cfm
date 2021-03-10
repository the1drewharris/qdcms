<cfparam name="form.approve" default="">
<cfparam name="form.delete" default="">
<cfset thereAreNoErrors=TRUE>
<!--- CASES
	1. approve and delete are same: just return;
	2. approve and delete share some imageids; delete them from both list;

	Process what is left in form.approve and form.delete
--->
<cfif form.approve NEQ form.delete>
 	<cfloop list="#form.approve#" index="imageid">
		<cfif listfindnocase(form.delete,imageid) GT 0>
			<cfset thereAreNoErrors=FALSE>
			<cfset client.errorlist="You can not approve and delete same image">
			<cfbreak>
		</cfif>
	</cfloop>
<cfelse>
	<cfif listlen(form.approve) GT 0>
		<cfset client.errorlist="You can not approve and delete same image">
	<cfelse>
		<cfset client.errorlist="You did not select any image to approve or delete">
	</cfif>
	<cfset thereAreNoErrors=FALSE>
</cfif>

<cfif thereAreNoErrors>
	<cftransaction>
		<cfif listlen(form.approve) GT 0>
			<cfinvoke component="#application.objimagegallery#" method="approveimages" imagedsn="#client.siteurl#" imagelist="#form.approve#">
		</cfif>
		<cfif listlen(form.delete) GT 0>
			<cfset args=StructNew()>
			<cfset args.imagedsn=client.siteurl>
			<cfset args.imagelist=form.delete>
			<cfset args.sitepath=client.sitepath>
			<cfset args.thumbdirlist=application.imagethumbs>
			<cfinvoke component="#application.objimagegallery#" method="deletePendingImages" argumentcollection="#args#">
		</cfif>
	</cftransaction>
	<cfinclude template="/actions/tracking.cfm">
<cfelse>
	<cfset client.message="Please correct the following errors">
	<cfset Session.formValues['approve']=form.approve>
	<cfset Session.formValues['delete']=form.delete>
</cfif>

<cflocation url="#CGI.HTTP_REFERER#" addtoken="false">