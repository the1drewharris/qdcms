<cfset args=StructNew()>
<cfset args.ds=mysiteurl>
<cfset args.authorid=client.masternameid>
<cfset navlist="Main Navigation, Footer Navigation">
<cfloop list="#navlist#" index="name">
	<cfset args.name=name>
	<cfinvoke component="#application.objnavigation#" method="addnavigation" argumentcollection="#args#">
</cfloop>