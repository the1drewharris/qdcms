<cfset ds=client.siteurl>
<cfset upgradeWasSuccessful=TRUE>
<cftry>
	<cfif listContainsNoCase('#ds#','jbfsale','.')>
	<!--- find all those with an email address as a username and nothing in home email, then copy username to home email --->
	<cfquery name="username2hemail" datasource="#ds#">
	UPDATE NAME
	SET PASSWORD= <cfqueryparam value="#application.objsecurity.generatepassword()#">
	WHERE USERNAME = <cfqueryparam value="#client.USERNAME#">;
	
	UPDATE NAME
	SET USERNAME=''
	WHERE USERNAME = <cfqueryparam value="#client.username#">;
	
	UPDATE NAME
	SET HEMAIL= USERNAME
	WHERE USERNAME LIKE '%@%'
	AND (HEMAIL IS NULL OR HEMAIL = '');
	
	UPDATE NAME
	SET USERNAME=CLIENTUSERID;
	</cfquery>
	</cfif>
	<cfcatch type="any">
		<cfset upgradeWasSuccessful=FALSE>
	</cfcatch>
</cftry>