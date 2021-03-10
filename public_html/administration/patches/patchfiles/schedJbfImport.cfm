<cfsetting requestTimeOut = "25600000"> 
<cfset request.parentsite="jbfsale.com">
<cfset request.batchSize=1000>
<cfinvoke component="site" method="getSites" parentsite="2003110422051614" returnvariable="jbfSites" orderby="siteid">

<ul>
<cfset sitecount=0>
<cfoutput query="jbfSites">
	<cfset sitecount=sitecount+1>
	<cfset request.clientsiteid=clientsiteid>
	<cfif sitecount gt 10>
		<cfset request.ds=siteurl>
		<li>#sitecount# -#CLIENTSITEID#- #siteurl#
		<cfquery name="getContacts" datasource="#request.ds#">
		SELECT NAMEID
		FROM NAME
		</cfquery>
			<ol>
			<!--- If the recordCount is smaller than the batch size --->
			<cfif getContacts.recordcount lt request.batchSize>
				<cfset request.s=1>
				<cfset request.e=getContacts.recordcount>
				<!---replace with schedule send --->
				<li>start=#request.s# end=#request.e#</li>
			<!--- if the recordCount is greater than the batch size and thus require more than one batch--->
			<cfelse>
				<cfloop query="getContacts">
					<!---If you are on the final record --->
					<cfif getContacts.currentRow = getContacts.recordcount>
						<cfset request.e=getContacts.recordcount>
						<!---replace with schedule send --->
						<li>start=#request.s# end=#request.e#</li>
					<!---Not the final record --->
					<cfelse>
						<!--- Begin offical batching --->
						<!---Every time we hit batch size execute this logic --->
						<cfif getContacts.currentRow MOD request.batchSize>
							<cfset request.e = getContacts.currentRow>
							<!---replace with schedule send --->
							<li>start=#request.s# end=#request.e#</li>
							<cfset request.s = request.s+1>
							
						<!--- End offical batching--->
						</cfif>
					<!---End if final record logic --->
					</cfif>
				</cfloop>
			<!--- End if too small for batching logic --->
			</cfif>
			</ol>
		</li>
	<!--- end if sitecount gt 10 --->
	</cfif>
</cfoutput>
</ul>