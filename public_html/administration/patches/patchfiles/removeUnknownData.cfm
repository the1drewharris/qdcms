<cfset ds=client.siteurl>
<cfset upgradeWasSuccessful=TRUE>
<cftry>
	<cfif listContainsNoCase('#ds#','jbfsale','.')>
	<!--- find all those with an email address as a username and nothing in home email, then copy username to home email --->
	<cfquery name="UPDATEUNKNOWN" datasource="#ds#">
	UPDATE NAME
	SET HPHONE= NULL
	WHERE HPHONE like <cfqueryparam value="%UNKNOWN%">
	OR HPHONE LIKE <cfqueryparam value="%)">;
	
	UPDATE NAME
	SET WPHONE= NULL
	WHERE WPHONE like <cfqueryparam value="%UNKNOWN%">
	OR WPHONE LIKE <cfqueryparam value="%)">;
	
	UPDATE NAME
	SET MPHONE= NULL
	WHERE MPHONE like <cfqueryparam value="%UNKNOWN%">
	OR MPHONE LIKE <cfqueryparam value="%)">;
	 
	UPDATE NAME
	SET OPHONE= NULL
	WHERE OPHONE like <cfqueryparam value="%UNKNOWN%">
	OR OPHONE LIKE <cfqueryparam value="%)">;
	</cfquery>
	</cfif>
	<cfcatch type="any">
		<cfset upgradeWasSuccessful=FALSE>
	</cfcatch>
</cftry>