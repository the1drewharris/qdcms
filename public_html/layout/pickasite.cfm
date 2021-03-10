<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<cfoutput>
	<html xmlns="http://www.w3.org/1999/xhtml">
		<head>
			<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
			<title>Pick a site</title>
			<link rel="stylesheet" href="/css/styles.css" media="screen" />
		</head>
		<body>
			<cfinclude template="/display/header.cfm">
			<div id="content-bg">
				<div id="content">
					<cfinclude template="/display/errors.cfm">
					<h2>
						Select a site 
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<cfif Session.sites.recordcount GT 12>
							<cfset previousLetter="">
							<a href="##numeric" style="text-decoration:none">0-9</a>
							<cfloop query="Session.sites">
								<cfset currentLetter=ucase(left(sitename,1))>
								<cfif currentLetter NEQ previousLetter>
									<cfif isNumeric(currentLetter)>
										<!--- Skip --->
									<cfelse>
										<a href="###currentLetter#" style="text-decoration:none">#currentLetter#</a>
									</cfif>
									<cfset previousLetter=currentLetter>
								</cfif>
							</cfloop>
						</cfif>
					</h2>
					<hr />
					<div id="site-select">
						<div class="group">
							<cfif Session.sites.recordCount LTE 12>
								<ol>
									<cfloop query="Session.sites">
										<li><a href="/cms/pickasiteaction/?siteid=#siteid#" title="select #sitename#">#sitename#</a></li>
									</cfloop>
								</ol>
							<cfelse>
								<cfset previousLetter = "">
								<div id="numeric"><h1>0-9</h1></div>
								<cfloop query="Session.sites">
									<cfset currentLetter = ucase(left(sitename,1))>
									<cfif currentLetter NEQ previousLetter>
										<cfif Session.sites.currentRow NEQ 1></ul></cfif>
										<cfif isNumeric(currentLetter)>
											<!--- Skip --->
										<cfelse>
											<div id="#currentLetter#"><h1>#currentLetter#</h1></div>
										</cfif>					
										<ul class="siteListingByLetter">
									</cfif>
									<li><a href="/cms/pickasiteaction/?siteid=#siteid#" title="select #sitename#">#sitename#</a></li>
									<cfset previousLetter=currentLetter>
									<cfif currentRow EQ recordCount></ul></cfif>
								</cfloop>
							</cfif>
						</div>
					</div>
				</div>
			</div>
			<cfinclude template="/display/footer.cfm">
		</body>
	</html>
</cfoutput>
