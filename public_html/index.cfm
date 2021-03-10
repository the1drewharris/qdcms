<!--- Any one can access this page. --->

<cfoutput>
	<cfset live=TRUE>
	<cfif request.sitedown EQ 1>
		<cfset iplist="70.185.197.35,64.207.230.206,208.65.113.150,208.65.113.152,208.65.113.153,208.65.113.156,24.249.75.140,70.189.95.45,216.104.220.193">
		<cfif listfindnocase(iplist, CGI.REMOTE_HOST) EQ 0>
			<cfset live=FALSE>
		</cfif>
	</cfif>
	<cfif live>
		<cfif NOT client.authenicated and listfindnocase('login,forgotpass,loginaction,forgotpassaction',url.section) EQ 0>
			<cflocation url="/cms/login" addtoken="false">
		<cfelseif client.authenicated AND client.siteid EQ 0 and listfindnocase("pickasite,pickasiteaction,logout",url.section) EQ 0>
			<cflocation url="/cms/pickasite" addtoken="false">
		<cfelseif client.authenicated AND listfindnocase('login,forgotpass,loginaction,forgotpassaction,0',url.section) GT 0>
			<cflocation url="/cms/others/dashboard" addtoken="false">		
		</cfif>

		<cfswitch expression="#url.section#">
			<cfcase value="loginaction">
				<cfset request.stream="logged into">
				<cfinclude template="/actions/loginaction.cfm">
			</cfcase>
			<cfcase value="forgotpassaction">
				<cfset request.stream="password emailed">
				<cfinclude template="/actions/forgotpassaction.cfm">
			</cfcase>
			<cfcase value="logout">
				<cfset request.stream="logged out">
				<cfinclude template="/actions/logoutaction.cfm">
			</cfcase>
			<cfcase value="pickasiteaction">
				<cfset request.stream="selected a site">
				<cfinclude template="/actions/pickasiteaction.cfm">
			</cfcase>
			<cfdefaultcase>
				<cfset request.stream=0>
				<cfinclude template="/layout/default.cfm">
			</cfdefaultcase>
		</cfswitch>
	<cfelse>
		<h1>This site is down for maintenance</h1>
		<p>Your IP address is: #cgi.REMOTE_HOST#</p>
	</cfif>
</cfoutput>