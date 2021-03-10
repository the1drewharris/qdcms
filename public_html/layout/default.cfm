<cfoutput>
	<cfif listfindnocase('login,forgotpass',url.section) GT 0>
		<cfinclude template="/layout/login.cfm">
	<cfelse>
		<!--- Include security layer --->
		<cfinclude template="/includes/securitylayer.cfm">
		
		<cfswitch expression="#url.section#">
			<cfcase value="pickasite">
				<cfinclude template="/layout/pickasite.cfm">
			</cfcase>
			<cfcase value="content">
				<cfinclude template="/content/index.cfm">
			</cfcase>
			<cfcase value="media">
				<cfinclude template="/media/index.cfm">
			</cfcase>
			<cfcase value="marketing">
				<cfinclude template="/marketing/index.cfm">
			</cfcase>
			<cfcase value="taskmgmt">
				<cfinclude template="/taskmgmt/index.cfm">
			</cfcase>
			<cfcase value="administration">
				<cfinclude template="/administration/index.cfm">
			</cfcase>
			<cfcase value="commerce">
				<cfinclude template="/commerce/index.cfm">
			</cfcase>
			<cfcase value="crm">
				<cfinclude template="/crm/index.cfm">
			</cfcase>
			<cfdefaultcase>
				<cfinclude template="/others/index.cfm">
			</cfdefaultcase>
		</cfswitch>
	</cfif>
</cfoutput>