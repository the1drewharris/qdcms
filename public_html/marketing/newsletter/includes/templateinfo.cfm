<cfparam name="url.newslettertemplateid" default="0">
<cfif NOT thereAreErrors>
	<cfif url.newslettertemplateid GT 0 and IsNumeric(url.newslettertemplateid)>
		<cfset args=structnew()>
		<cfset args.ds=client.siteurl>
		<cfset args.newslettertemplateid=url.newslettertemplateid>
		<cfinvoke component="#application.objnewsletter#" method="getTemplate" argumentcollection="#args#" returnvariable="mytemplate">
		<cfif mytemplate.recordcount GT 0>
			<cfset session.formValues['name']=mytemplate.name>
			<cfset session.formValues['description']=mytemplate.description>
			<cfset session.formValues['template']=mytemplate.template>
			<cfset session.formValues['newslettertemplateid']=mytemplate.newslettertemplateid>
			<cfset session.formValues['imagepath']=mytemplate.imagepath>
			<cfset session.formValues['status']=mytemplate.status>
		<cfelse>
			<cflocation url="/cms/marketing/newsletter/shownewslettertemplates" addtoken="false">
		</cfif>
	<cfelse>
		<cflocation url="/cms/marketing/newsletter/shownewslettertemplates" addtoken="false">
	</cfif>
</cfif>