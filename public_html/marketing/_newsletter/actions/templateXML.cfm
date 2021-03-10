<cfsetting showDebugOutput="No">
<cfset args=Structnew()>
<cfset args.ds=client.siteurl>
<cfset args.parentsiteid=client.parentsiteid>
<cfinvoke component="#application.objnewsletter#" method="myXmlTemplates" argumentcollection="#args#" returnvariable="myXml">
<cfoutput>#myXml#</cfoutput>