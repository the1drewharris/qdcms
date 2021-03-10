<div id="video-tutorials">
	<h2>Video Tutorials</h2><br />
	<a href="http://www.youtube.com/user/qdcms" target="_blank">QDCMS You Tube Channel</a>
</div>
<br />

<div id="web-email">
	<h2>Quantum Delta Web Mail</h2><br />
	<cfif listfindnocase(client.siteurl,'jbfsale','.')>
		<a href="http://webmail.jbfsale.com" target="_blank" title="JBF Webmail">JBF Webmail Login Screen</a><br />
	<cfelse>
		<a href="http://mail.web-host.net/roundcube" target="_blank" title="RoundCube Webmail Beta">RoundCube Webmail Login Screen Beta</a><br />
	</cfif>
	
	<a href="http://www.quantumdelta.com/pages/email_instructions.html" target="_blank" title="Email set up instructions">Email set up instructions</a><br />
	<a href="http://mailguard.web-host.net/" target="_blank" title="Maia Mailguard Antispam Interface">Maia Mailguard Antispam Login Screen</a><br />
</div>
<br />
<cfif listfindnocase(client.siteurl,'jbfsale','.')>
<div id="legacy-jbf">
	<h2>Legacy JBFManager Links (Must have active session)</h2>
	<a href="http://jbfmanager.com/index.cfm?fuseaction=vs.home" target="_blank" title= "Volunteer Scheduling">Volunteer Scheduling</a><br />
	<a href="http://jbfmanager.com/index.cfm?fuseaction=eventmanagement.selectevent&eventcategory=Worker%20Confirmation%20email" target="_blank" title= "Worker confirmation email">Worker Confirmation email</a><br />
</div>
<br />
</cfif>