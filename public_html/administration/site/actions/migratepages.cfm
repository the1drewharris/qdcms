<cfparam name="striphtmlinwebpages" default="FALSE">
<cfobject component="webpage" name="wp">
<cfinvoke component="#wp#" method="getOldPages" dsn="#mysiteurl#" returnvariable="myOldPages">
<cfinvoke component="#wp#" method="getPages" webdsn="#mysiteurl#" returnvariable="currentPages">
<cfdump var="#currentPages#">
<cfoutput query = "currentPages">
	<cfif wpid neq "">
		<cfinvoke component="#wp#" method="deletePage" webdsn="#mysiteurl#" wpid="#wpid#">
	</cfif>
</cfoutput>
<cfquery name="onlywebpages" dbtype="query">
	SELECT * FROM myOldPages WHERE ALTLAYOUT IS NULL
</cfquery>

<cfquery name="onlylinks" dbtype="query">
	SELECT * FROM myOldPages WHERE ALTLAYOUT IS NOT NULL
</cfquery>

<cfloop query="onlywebpages">

		<cfset args=StructNew()>
		<cfif striphtmlinwebpages>
			<cfset args.wpcontent=application.objtextconversion.striphtml(description)>
		<cfelse>
			<cfset args.wpcontent=description>
		</cfif>
		<cfset args.name=application.objtextconversion.getWords(eventname,'25')>
		<cfset args.urlname=pagename>
		<cfset args.startdate=starttime>
		<cfset args.enddate=endtime>
		<cfset args.title=application.objtextconversion.getWords(title,'15')>
		<cfset args.keywords=application.objtextconversion.getWords(keywords,'50')>
		<cfset args.description=application.objtextconversion.getWords(sedescription,'100')>
		<cfset args.authorid=client.masternameid>
		<cfset args.ignoreenddate=1>
		<cfset args.authorid=client.masternameid>
		<cfset args.wpstatus="Published">
		<cfinvoke component="#wp#" method="addPage" webdsn="#mysiteurl#" argumentcollection="#args#">

</cfloop>

<cfloop query="onlylinks">
	<cfinvoke component="#Application.objlinks#" method="addlink" ds="#mysiteurl#" name="#eventname#" href="#altlayout#">
</cfloop>