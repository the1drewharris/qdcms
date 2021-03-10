<cfset destination='#client.sitepath#/podcast'>
<cfset sampleDestination='#client.sitepath#/samplepodcast'>
<cfif NOT directoryExists(destination)>
	<cfdirectory action="create" directory="#destination#" mode="775">
</cfif>
<cfif NOT directoryExists(sampleDestination)>
	<cfdirectory action="create" directory="#sampleDestination#" mode="775">
</cfif>