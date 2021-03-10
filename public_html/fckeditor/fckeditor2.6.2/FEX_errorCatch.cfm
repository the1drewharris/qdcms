<!--- -->
<xmp>
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE fusedoc SYSTEM "http://fusebox.org/fd4.dtd">
<fusedoc fuse="FEX_errorCatch.cfm" language="ColdFusion" specification="2.0">
	<responsibilities></responsibilities>
	<properties>
		<history author="Nat Papovich" date="05/03/2002" email="nat@fusium.com" role="Architect" type="Create"/>
	</properties>
	<io>
		<in>
			<structure name="fusebox.cfcatch" format="CFML" Scope="variables">
				<string name="type" comments="Error type, either a ColdFusion standard error type, a custom-thrown type or 'fusebox'" />
				<number name="errorCode" comments="For type='fusebox', this value is the section in the core file where the error occured." />
				
			</structure>
		</in>
		<out>
		</out>
		<passthrough>
			<string scope="request" name="urltoken" comments="pass on all urls and form actions"/>
		</passthrough>
	</io>
</fusedoc>
</xmp>
--->

<cfswitch expression="#fusebox.cfcatch.type#">
	
	<cfcase value="fusebox">
		<cfswitch expression="#fusebox.cfcatch.errorCode#">
			<!--- Error Codes:
			5: Error in or missing fbx_circuits.cfm
			6: Invalid circuits structure or none created
			7: Missing root fbx_settings.cfm
			8: Invalid or missing Fuseaction variable
			9: An incorrect or unregistered circuit has been requested
			13: Unable to find the layoutfile specified
			 --->
			<!--- You can create your own <cfcase></cfcase> blocks here to handle individual Fusebox errors, like these examples: --->

			<cfcase value="8">
				<cfoutput>
				<table id="bigtext-smallimage-abs">
				<tbody><tr><td id="bigtext">
				<h1>This page has encountered an error.</h1>
				<h2>The page you were looking for, could have been moved.</h2>
				<h3>Please check <a href="#self#">here</a> for the page you are looking for.</h3>
				<h4>The Administrator has been emailed with more detailed error information for debugging.</h4>
				<p>Thank you.</p>
				</td>
				<td id="smallimage">
				<img width="144" height="144" border="0" src="http://jbfsale.com/images/kids-apply_03.jpg" />
				</td>
				</tr>
				</tbody>
				</table>
				</cfoutput>
				
				<cfsavecontent variable="errormessage">
				<cfoutput>
				<h3>There was an error</h3>
				<p>
				cgi = <cfdump var="#CGI#" expand="yes">
				</p>
				<p>
				form = <cfdump var="#form#" expand="yes">
				</p>
				<p>
				url = <cfdump var="#url#" expand="yes">
				</p>
				<p>
				request = <cfdump var="#request#" expand="yes">
				</p>
				<p>
				session = <cfdump var="#session#" expand="yes">
				</p>
				<cfwddx action="WDDX2CFML" input="#fusebox.cfcatch.extendedinfo#" output="thisError">
				<b>ColdFusion native error:</b><p>#thisError.detail#<p>#thisError.message#
				<p>Attention! You have requested an invalidly-formatted fuseaction. The fuseaction <pre>#attributes.fuseaction#</pre> is not correct.<p><b>Core message:</b> #fusebox.cfcatch.message#<p>
				</cfoutput>
				</cfsavecontent>
				<cfoutput>An error has occurred coming from: #cgi.HTTP_REFERER#
				<br>while going to: #cgi.PATH_TRANSLATED#
				#errormessage#</cfoutput>
			</cfcase>

			<cfcase value="9">
				<cfoutput>
				<table id="bigtext-smallimage-abs">
				<tbody><tr><td id="bigtext">
				<h1>This page has encountered an error.</h1>
				<h2>The page you were looking for, could have been moved.</h2>
				<h3>Please check <a href="#self#">here</a> for the page you are looking for.</h3>
				<h4>The Administrator has been emailed with more detailed error information for debugging.</h4>
				<p>Thank you.</p>
				</td>
				<td id="smallimage">
				<img width="144" height="144" border="0" src="http://jbfsale.com/images/kids-apply_03.jpg" />
				</td>
				</tr>
				</tbody>
				</table>
				</cfoutput>
				
				<cfsavecontent variable="errormessage">
				<cfoutput>
				<h3>There was an error</h3>
				<p>
				cgi = <cfdump var="#CGI#" expand="yes">
				</p>
				<p>
				form = <cfdump var="#form#" expand="yes">
				</p>
				<p>
				url = <cfdump var="#url#" expand="yes">
				</p>
				<p>
				request = <cfdump var="#request#" expand="yes">
				</p>
				<p>
				session = <cfdump var="#session#" expand="yes">
				</p>
				<cfwddx action="WDDX2CFML" input="#fusebox.cfcatch.extendedinfo#" output="thisError">
				<b>ColdFusion native error:</b><p>#thisError.detail#<p>#thisError.message#
				<p>
				Attention! You have requested an incorrect circuit. The circuit name <pre>#fusebox.circuit#</pre> is not available.<p><b>Core message:</b> #fusebox.cfcatch.message#<p>
				</cfoutput>
				</cfsavecontent>
				<cfoutput>An error has occurred coming from: #cgi.HTTP_REFERER#
				<br>while going to: #cgi.PATH_TRANSLATED#
				#errormessage#</cfoutput>
			</cfcase>

			<cfdefaultcase>
				
				<cfoutput>
				<table id="bigtext-smallimage-abs">
				<tbody><tr><td id="bigtext">
				<h1>This page has encountered an error.</h1>
				<h2>The page you were looking for, could have been moved.</h2>
				<h3>Please check <a href="#self#">here</a> for the page you are looking for.</h3>
				<h4>The Administrator has been emailed with more detailed error information for debugging.</h4>
				<p>Thank you.</p>
				</td>
				<td id="smallimage">
				<img width="144" height="144" border="0" src="http://jbfsale.com/images/kids-ready-to-join.jpg" />
				</td>
				</tr>
				</tbody>
				</table>
				</cfoutput>
				
				<cfsavecontent variable="errormessage">
				<cfoutput>
				<h3>There was an error</h3>
				<p>
				cgi = <cfdump var="#CGI#" expand="yes">
				</p>
				<p>
				form = <cfdump var="#form#" expand="yes">
				</p>
				<p>
				url = <cfdump var="#url#" expand="yes">
				</p>
				<p>
				request = <cfdump var="#request#" expand="yes">
				</p>
				<p>
				session = <cfdump var="#session#" expand="yes">
				</p>
				<cfwddx action="WDDX2CFML" input="#fusebox.cfcatch.extendedinfo#" output="thisError">
				<b>ColdFusion native error:</b><p>#thisError.detail#<p>#thisError.message#
				</cfoutput>
				</cfsavecontent>
				<cfoutput>An error has occurred coming from: #cgi.HTTP_REFERER#
				<br>while going to: #cgi.PATH_TRANSLATED#
				#errormessage#</cfoutput>
			</cfdefaultcase>
		</cfswitch>
	</cfcase>

	<cfcase value="MissingInclude">
				<cfoutput>
				<table id="bigtext-smallimage-abs">
				<tbody><tr><td id="bigtext">
				<h1>This page has encountered an error.</h1>
				<h2>The page you were looking for, could have been moved.</h2>
				<h3>Please check <a href="#self#">here</a> for the page you are looking for.</h3>
				<h4>The Administrator has been emailed with more detailed error information for debugging.</h4>
				<p>Thank you.</p>
				</td>
				<td id="smallimage">
				<img width="144" height="144" border="0" src="http://jbfsale.com/images/kids-apply_03.jpg" />
				</td>
				</tr>
				</tbody>
				</table>
				</cfoutput>
				
				<cfsavecontent variable="errormessage">
				<cfoutput>
				<h3>There was an error</h3>
				<p>
				cgi = <cfdump var="#CGI#" expand="yes">
				</p>
				<p>
				form = <cfdump var="#form#" expand="yes">
				</p>
				<p>
				url = <cfdump var="#url#" expand="yes">
				</p>
				<p>
				request = <cfdump var="#request#" expand="yes">
				</p>
				<p>
				session = <cfdump var="#session#" expand="yes">
				</p>
				<cfwddx action="WDDX2CFML" input="#fusebox.cfcatch.extendedinfo#" output="thisError">
				<b>ColdFusion native error:</b><p>#thisError.detail#<p>#thisError.message#
				</cfoutput>
				</cfsavecontent>
				<cfoutput>An error has occurred coming from: #cgi.HTTP_REFERER#
				<br>while going to: #cgi.PATH_TRANSLATED#
				#errormessage#</cfoutput>
	</cfcase>

	<cfdefaultcase>
	<cfoutput>
				<table id="bigtext-smallimage-abs">
				<tbody><tr><td id="bigtext">
				<h1>This page has encountered an error.</h1>
				<h2>The page you were looking for, could have been moved.</h2>
				<h3>Please check <a href="#self#">here</a> for the page you are looking for.</h3>
				<h4>The Administrator has been emailed with more detailed error information for debugging.</h4>
				<p>Thank you.</p>
				</td>
				<td id="smallimage">
				<img width="144" height="144" border="0" src="http://jbfsale.com/images/kids-apply_03.jpg" />
				</td>
				</tr>
				</tbody>
				</table>
				</cfoutput>
				
				<cfsavecontent variable="errormessage">
				<cfoutput>
				<h3>There was an error</h3>
				<p>
				cgi = <cfdump var="#CGI#" expand="yes">
				</p>
				<p>
				form = <cfdump var="#form#" expand="yes">
				</p>
				<p>
				url = <cfdump var="#url#" expand="yes">
				</p>
				<p>
				request = <cfdump var="#request#" expand="yes">
				</p>
				<p>
				session = <cfdump var="#session#" expand="yes">
				</p>
				<cfwddx action="WDDX2CFML" input="#fusebox.cfcatch.extendedinfo#" output="thisError">
				<b>ColdFusion native error:</b><p>#thisError.detail#<p>#thisError.message#
				</cfoutput>
				</cfsavecontent>
				<cfoutput>An error has occurred coming from: #cgi.HTTP_REFERER#
				<br>while going to: #cgi.PATH_TRANSLATED#
				#errormessage#</cfoutput>
	</cfdefaultcase>
</cfswitch>

