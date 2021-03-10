<cfset ds=client.siteurl>
<cfset upgradeWasSuccessful=TRUE>
<cftry>
	<cfif listContainsNoCase('#ds#','jbfsale','.')>
	
	<cfquery name="elimateincompletephones" datasource="#ds#">
	UPDATE NAME
	SET HPHONE=''
	WHERE LEN(HPHONE) < 7;
	
	UPDATE NAME
	SET WPHONE=''
	WHERE LEN(WPHONE) < 7;
	
	UPDATE NAME
	SET OPHONE=''
	WHERE LEN(OPHONE) < 7;
	
	UPDATE NAME
	SET HPHONE=''
	WHERE HPHONE like '%no number%';
	
	UPDATE NAME
	SET WPHONE=''
	WHERE  WPHONE like '%no number%';
	
	UPDATE NAME
	SET OPHONE=''
	WHERE  OPHONE like '%no number%';
	</cfquery>
	</cfif>
	<cfcatch type="any">
		<cfset upgradeWasSuccessful=FALSE>
	</cfcatch>
</cftry>