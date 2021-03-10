<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<cfif url.section EQ "login">
	<cfset title="Login Screen">
<cfelse>
	<cfset title="Forgot Password">
</cfif>
<cfoutput>
	<html xmlns="http://www.w3.org/1999/xhtml">
		<head>
			<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
			<title>#title#</title>
			<link rel="stylesheet" href="/css/styles.css" media="screen" />
		</head>
		<body id="login">
			<div id="content-bg">
				<div id="content">
					<cfif isDefined("client.jbfDenied")>
						<cfif client.jbfDenied neq 0>
							<cfoutput>#client.jbfDenied#</cfoutput>
						</cfif>
					</cfif>
				</div>
			</div>
			<div id="login-div">
				<cfif Trim(client.errorlist) NEQ "">
					<div class="text">#client.errorlist#</div>
					<cfset client.errorlist="">
				</cfif>
				<cfif url.section EQ "login">
					<form action="/cms/loginaction" method="post">
						<label for="myusername">Username: </label>
						<input type="text" name="myusername" /><br />
						
						<label for="pass">Password: </label>
						<input type="password" name="pass" class="required" /><br />
						
						<div class="text">
							Forgot Password? <a href="/cms/forgotpass">Click Here</a> to have it e-mailed to you.
						</div>
						<input type="submit" value="Login" class="btnLogin" />
					</form>
				<cfelse>
					<form action="/cms/forgotpassaction" method="post">
						<div class="text" style="margin-left: -50px; padding-bottom: 5px; ">Forgot your password? Type in your e-mail address and your e-mail address will be sent to you.</div>
						<label for="email">email: </label>
						<input type="text" name="email" title="Email is required, and must be a valid e-mail address." /><br />
						
						<input type="submit" value="Email Password" class="btnLogin" />
					</form>
				</cfif>
				<br />	
				<div class="text">
					By using this site you are agreeing to QuantumDelta's <a href="http://www.quantumdelta.com/pages/terms_of_service.html" target="_blank">Terms of Service</a>.
				</div>
			
			</div>
			
				<!--- <cfdump var="#client#">
			<cfdump var="#session#"> --->
		</body>
	</html>
</cfoutput>
