<cfswitch expression="#url.action#">
	<cfcase value="actionaddnewsletter,actioneditnewsletter">
		<!--- <cfset ipList="72.213.140.214,75.221.206.189,64.207.230.206,72.100.88.190,99.117.22.81,209.33.73.4,75.199.187.96,24.17.94.142">
		<cfif listcontainsnocase('#ipList#','#cgi.REMOTE_HOST#')>
			<cfset live=TRUE>
		<cfelse>
			<cfset live=FALSE>
		</cfif> --->
		<cfset live=true>
		<cfif live>
			<cfif url.action eq 'actionaddnewsletter'>
				<cfset request.stream="added a newsletter">
			<cfelse>
				<cfset request.stream="edited a newsletter">
			</cfif>
			<cfinclude template="actions/addeditnewsletter.cfm">
		<cfelse>
			<h1>Currently Disabled</h1>
		</cfif>
	</cfcase>
	<cfcase value="deletenewsletter">
		<cfset request.stream="deleted a newsletter">
		<cfinclude template="actions/deletenewsletter.cfm">
	</cfcase>
	<cfcase value="copynewsletter">
		<cfset request.stream="copied a newsletter">
		<cfinclude template="actions/copynewsletter.cfm">
	</cfcase>
	<cfcase value="actionaddnewslettertemplate">
		<cfset request.stream="added a newsletter template">
		<cfinclude template="actions/addnewslettertemplate.cfm">
	</cfcase>
	<cfcase value="actioneditnewslettertemplate">
		<cfset request.stream="edited a newsletter template">
		<cfinclude template="actions/editnewslettertemplate.cfm">
	</cfcase>
	<cfcase value="copynewsletterTemplate">
		<cfset request.stream="copied a newsletter template">
		<cfinclude template="actions/copyTemplate.cfm">
	</cfcase>
	<cfcase value="deletenewsletterTemplate">
		<cfset request.stream="deleted a newsletter template">
		<cfinclude template="actions/deleteTemplate.cfm">
	</cfcase>
	<cfcase value="downloadreport">
		<cfset request.stream="downloaded a newsletter report">
		<cfinclude template="actions/downloadreport.cfm">
	</cfcase>
	<cfdefaultcase>
		<cfset request.stream=0>
		<cfinclude template="layout/default.cfm">
	</cfdefaultcase>
</cfswitch>