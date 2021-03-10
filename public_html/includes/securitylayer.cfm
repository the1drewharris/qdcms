<!--- Security layer 1: To check if a user has permission to access a module --->

<!--- 
	Version 1
	
	1. Check if client.roleid is EQ 7.
		Y: Everything is allowed.
		N: Go to step 2
	2. Is site allowed?
		N: Access Denied
	   	Y: Go to step 4
	3. Is module allowed?
		N: Access Denied
		Y: Go to step 5
	4. Does the user have right permission? FOR BLOGS ONLY SKIP THIS FOR NOW
		N: Access Denied
		Y: Go to step 6
	5. Let the user execute the code 	
	
	Added on 2011-01-13
		If the user is trying to update his/her profile, let him/her
--->
<cfset isAllowed=FALSE>
<cfif url.section EQ "others" AND url.module EQ "dashboard">
	<cfset isAllowed=TRUE>
<cfelseif url.section EQ "pickasite">
	<cfset isAllowed=TRUE>
<cfelseif url.module EQ "0">
	<cfif isDefined('session.MYNAV.SECTIONS.XMLTEXT')>
		<cfif listfindnocase(session.myNav.Sections.XmlText,url.section) GT 0>
			<cfset isAllowed=TRUE>
		</cfif>
	<cfelse>
		<cfset isAllowed=FALSE>
	</cfif>
<cfelseif client.roleid EQ 7> <!--- Step 1 --->
	<cfset isAllowed=TRUE>
<cfelseif url.section EQ 'others' AND url.module EQ 'user'>
	<cfset isAllowed=TRUE>
<cfelse>
	<cfif listfindnocase(client.allowedsites,client.siteid) GT 0> <!--- step 2 --->
		<cfset pos=listfindnocase(session.acl.aclmodules,url.module)> <!--- step 3 --->
		<cfif pos GT 0>
			<cfset permissionValue=listgetAt(session.acl.permission,pos)> <!--- step 4--->
			<cfif permissionValue EQ 3>
				<cfset isAllowed=TRUE>
			<cfelse>
				<cfif permissionValue GTE request.actiontype>
					<cfset isAllowed=TRUE>
				</cfif>
			</cfif>
			<!--- step 4 End --->
		</cfif>
	</cfif>
</cfif>

<cfif NOT isAllowed> <!--- Error --->
	<cflocation url="/cms/accessdenied" addtoken="false">
</cfif>

<!--- Step 5 --->