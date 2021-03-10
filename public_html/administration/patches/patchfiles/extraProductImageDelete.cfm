<cfset ds=client.siteurl>
<cfset upgradeWasSuccessful=TRUE>
<cftry>
	<cfif ds eq "vcientertainment.com">
	<cfquery name="getIDs" datasource="#ds#">
	SELECT DISTINCT ID
	FROM ITEMIMAGES
	</cfquery>
	

	<cfoutput query="getIDs">
		<cfquery name="getCount" datasource="#ds#">
		SELECT COUNT(IMAGEID) AS THISCOUNT
		FROM ITEMIMAGES
		WHERE ID = <cfqueryparam value="#id#">
		</cfquery>
		<cfif getCount.thiscount gt 1>
			<cfquery name="notPNG" datasource="ds">
			SELECT IMAGE.IMAGEPATH
			FROM IMAGE, ITEMIMAGES
			WHERE ITEMIMAGES.ID=<cfqueryparam value="#id#">
			AND IMAGE.IMAGEID=ITEMIMAGES.IMAGEID
			AND IMAGE.IMAGEPATH NOT LIKE <cfqueryparam value="%.png">
			</cfquery>
			<cfif notPNG.recordcount gt 0>
			#id#-#notPNG.imagepath#<br />
			</cfif>
		</cfif>
		
	</cfoutput>
	

	<cfcatch type="any">
		<cfset upgradeWasSuccessful=FALSE>
	</cfcatch>
</cftry>