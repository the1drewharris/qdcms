<html>
	<head>
	</head>
	<body>
		<cfparam name="url.id" default="">
		<cfif url.id>
			<cfinvoke component="#Application.abCFC#" method="getContactInfo" contactdsn="#client.siteurl#" nameid="#url.id#" returnVariable="mapInfo" />
			<cfoutput query="mapInfo">
				<table width="100%" class="mapPrintOut"><tr><td valign="top" width="50%">
					<cfif len(lastname)>#lastname#, </cfif><cfif len(firstname)>#firstname#<br /></cfif>
					<cfif len(company)>#company#<br /></cfif>
					<cfif len(address1)>#address1#<br /></cfif>
					<cfif len(address2)>#address2#<br /></cfif>
					<cfif len(city) AND len(state)>
						#city#, #state#
					<cfelseif len(city) OR len(state)>
						#city# #state#
					</cfif>
					<cfif len(zip)>#zip#</cfif>
				</td><td valign="top" width="50%" align="right">
					Home Phone: #hphone#<br />
					Work Phone: #wphone#<br />
					Home Email: #hemail#<br />
					Work Email: #wemail#
				</td></tr><table>
				<cf_displayMap googleAPIKey="#application.googleapikey#" selfLat = "#lat#" selfLon = "#lon#" selfType = "blank" mapOptions = "G_MAP_TYPE GSmallMapControl GMapTypeControl GScaleControl" width = "640px" height = "315px" autoType = "yes">
			</cfoutput>
		</cfif>
	</body>
</html>