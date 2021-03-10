<cfparam name="url.c" default="0">
<cfif NOT thereAreErrors>
	<cfif isNumeric(url.c)>
		<cfinvoke component="#application.objproduct#" method="getCategory" productdsn="#client.siteurl#" categoryid="#url.c#" returnvariable="mycategory">
		<cfif mycategory.recordcount GT 0>
			<cfset session.formValues['categoryid']=mycategory.categoryid>
			<cfset session.formValues['category']=mycategory.category>
			<cfset session.formValues['parentid']=mycategory.parentid>
		<cfelse>
			<cfset client.message="Click on category to edit">
			<cflocation url="/cms/#url.section#/#url.module#/showcategories" addtoken="false">
		</cfif>
	<cfelse>
		<cfset client.message="Click on category to edit">
		<cflocation url="/cms/#url.section#/#url.module#/showcategories" addtoken="false">
	</cfif>
</cfif>