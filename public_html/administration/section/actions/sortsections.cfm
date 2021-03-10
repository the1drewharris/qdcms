<cfinclude template="validatesortsectionslist.cfm">
<cfif thereAreNoErrorsInForm>
	<cfset sortorderlist="">
	<cfset sectionlist=valueList(sections.sectionid)>
	<cfloop query="sections">
		<cfset sortordervalue=Evaluate('form.s_#sectionid#')*10>
		<cfset sortorderlist=listAppend(sortorderlist,sortordervalue)>
	</cfloop>
	<cftransaction>
		<cfinvoke component="#application.objqdsecurity#" method="sortSectionsInProduct" productid="#application.productid#" sectionlist="#sectionlist#" sortorderlist="#sortorderlist#">
	</cftransaction>
</cfif>
<cflocation url="#CGI.HTTP_REFERER#" addtoken="false">