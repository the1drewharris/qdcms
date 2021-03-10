<cfset destination='#client.sitepath#/videos'>
<cfset sampleDestination='#client.sitepath#/samplevideos'>
<cfset imageDestination='#client.sitepath#/images'>

<cfif NOT directoryExists(destination)>
	<cfdirectory action="create" directory="#destination#" mode="775">
</cfif>
<cfif NOT directoryExists(sampleDestination)>
	<cfdirectory action="create" directory="#sampleDestination#" mode="775">
</cfif>
<cfif NOT directoryExists(imageDestination)>
	<cfdirectory action="create" directory="#imageDestination#" mode="775">
</cfif>

<cfset noofthumbs=listLen(application.imagethumbs)>

<cfloop from="1" to="5" index="i">
	<cfset thumbDir=listGetAt(Application.imagethumbs,i)>
	<cfset thumbDestination='#imageDestination#/#thumbDir#'>
	<cfif NOT directoryExists(thumbDestination)>
		<cfdirectory action="create" directory="#imageDestination#" mode="775">
	</cfif>
</cfloop>