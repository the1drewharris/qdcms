<cfswitch expression="#url.module#">
	<cfcase value="products">
		<cfinclude template="/commerce/products/index.cfm">
	</cfcase>
	<cfcase value="subscription">
		<cfinclude template="/commerce/subscription/index.cfm">
	</cfcase>
	<cfdefaultcase>
		<cfinclude template="/commerce/layout/default.cfm">
	</cfdefaultcase>
</cfswitch>