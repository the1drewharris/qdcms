<cfparam name="url.s" default="0">
<cfif isNumeric(url.s)>
<cfoutput>
	<cfset perPage=30>
	<cfset thisSite='quantumdelta.com'>
	<cfset args=structNew()>
	<cfset args.siteids=mysiteids>
	<cfset args.statusid=statusid>
	<cfset args.startvalue=url.s>
	<cfset args.perPage=perPage>
	<!--- <h2><cfdump var="#mysiteids#"></h2> --->
	<cfinvoke component="#application.objincident#" method="getNoOfIncidents" incidentdsn="#thisSite#" argumentcollection="#args#" returnvariable="noofincidents">
	<cfinvoke component="#application.objincident#" method="getincidentHeaders" incidentdsn="#thissite#" argumentcollection="#args#" returnvariable="incidents">
	<cfif incidents.recordcount GT 0>
		<h3>#headertext#</h3>
		<table class="datagrid" id="managePagesTable">
			<tr class="titlebar">
				<th>Incident Description</th>
				<th>Site</th>
				<th>Reported By</th>
				<th>Reported On</th>
				<th>Screenshot</th>
			</tr>
			<cfloop query="incidents">
				<cfinvoke component="#application.abCFC#" method="getContactviaNameid" contactdsn="#Application.masterdsn#" nameid="#nameid#" returnvariable="submitterName">
				<tr>
					<cfset incident_description=Application.objtextconversion.stripHTML(incidentdescription)>
					<cfset incident_description=Application.objtextconversion.getWords(incident_description,'25')>
					<td><a href="/cms/#url.section#/#url.module#/showincident/?incidentid=#incidentid#"><cfif incident_description neq "">#incident_description#<cfelse>#incidentid#</cfif></a></td>
					<td>#incidenturl#</td>
					<td>#submitterName.firstname# #submitterName.lastname#</td>
					<cfset reporteddate=Application.objtimedateconversion.convertDate(timereported,"mm/dd/yyyy")>
					<cfset reportedtime=Application.objtimedateconversion.convertTime(timereported,"hh:mmtt")>
					<td>#reporteddate# #reportedtime#</td>
					<td>
						<cfif screenshotname NEQ "">
							<a href="http://#thissite#/troubleticket_screenshots/#screenshotname#" target="_blank">View</a>
						<cfelse>
							Unavailable
						</cfif>
					</td>
				</tr>
			</cfloop>
			<cfif noofincidents GT perPage>
				<tr>
					<td colspan="5">
						<cfset argsPagination=StructNew()>
						<cfset argsPagination.prefixURL="/cms/#url.section#/#url.module#/#url.action#/?s=">
						<cfset argsPagination.rowLabel="Incidents">
						<cfset argsPagination.perPage=perPage>
						<cfset argsPagination.totalRows=noofincidents>
						<cfset argsPagination.delimeter="&bull">
						<cfset argsPagination.currentValue=url.s>
						<cfinvoke component="#application.objpagination#" method="get" argumentcollection="#argsPagination#" returnvariable="pagination">
						#pagination#
					</td>
				</tr>
			</cfif>
		</table>
	<cfelse>
		<h1>There are no reported incidents at this time for this site.</h1>
	</cfif>
</cfoutput>
<cfelse>
	<cflocation url="/cms/#url.section#/#url.module#/#url.action#" addtoken="false">
</cfif>