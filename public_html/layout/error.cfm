<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<cfinvoke component="site" method="getSites" returnvariable="mySites">
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
					<cfset errortype=client.errortype>
					<cfset client.errortype=0>
					<cfswitch expression="#errortype#">
						<cfcase value="1"> Access Denied
							<h1>Access Denied</h1>
							You do not have permission to access this page.
						</cfcase>
						<cfdefaultcase>
							Some thing happend and we don't know. I will find out and let you know.
						</cfdefaultcase>
					</cfswitch>
					
				</div>
			</div>
			<cfinclude template="/display/footer.cfm">
		</body>
	</html>
</cfoutput>