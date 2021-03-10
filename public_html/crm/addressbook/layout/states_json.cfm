<cfheader name="Content-type" value="application/json">
<cfinvoke component="addressbook" method="getstates" returnvariable="states" country="0">
[
<cfloop query="states">
	<cfoutput>{"country":"#countryid#","name":"#statename#","abbv":"#stateid#"}<cfif states.currentrow NEQ states.recordcount>,</cfif></cfoutput>
</cfloop>
]