<!--- import all jbf contacts --->
<cfflush interval="5">
<cfsetting requestTimeOut = "25600000"> 
<cfset request.parentsite="jbfsale.com">
<!--- <cfset alphaCount="A,B,C,D,E,F,G,H,I,J,K,L,M,M,O,P,Q,R,S,T,U,V,W,X,Y,Z"> --->
<cfinvoke component="site" method="getSites" parentsite="2003110422051614" returnvariable="jbfSites" orderby="siteid">
<!--- <cfoutput>alphacount=#listLen(alphaCount)#</cfoutput> --->
<ol>

<cfset sitecount=0>

<!--- <cfset siteCodeCount=0>
<cfset alphaLoopCount=1>
<cfset preSiteCode=listGetat(alphaCount,alphaLoopCount)> --->

<cfoutput query="jbfSites">
	<cfset sitecount=sitecount+1>
	<cfset request.clientsiteid=clientsiteid>
	<!--- <cfif siteCodeCount GTE #listLen(alphaCount)#>
		<cfset siteCodeCount=0>
		<cfset alphaLoopCount=alphaLoopCount+1>
		<cfset preSiteCode=listGetat(alphaCount,alphaLoopCount)>
	</cfif>
	
	<cfset siteCodeCount=siteCodeCount+1>
	<cfset siteCode=listGetat(alphaCount,siteCodeCount)>
	
	<cfset finalSiteCode="#preSiteCode##siteCode#"> --->
	<cfif sitecount eq 10>
	<li>#sitecount# -#CLIENTSITEID#- #siteurl#
		<!--- <cfquery name="updateThisSite" datasource="deltasystem">
		UPDATE SITE
		SET CLIENTSITEID = '#finalSiteCode#'
		WHERE SITEURL = '#SITEURL#'
		</cfquery>
		SITECODE ADDED --->
	<!--- reset the groupID var --->
	<cfset groupID=0>
	<cfswitch expression="#request.clientsiteid#">
		<cfcase value="AD">
			<cfset groupid="2011022414121418">
		</cfcase>
		<cfcase value="AE">
			<cfset groupid="2011022415263389">
		</cfcase>
		<cfcase value="AF">
			<cfset groupid="2011022417401783">
		</cfcase>
		<cfcase value="AH">
			<cfset groupid="2011022418564782">
		</cfcase>
		<cfcase value="AK">
			<cfset groupid="2011022420195813">
		</cfcase>
		<cfcase value="AJ">
			<cfset groupid="2011022419400721">
		</cfcase>
		<cfdefaultcase>
		<cfinvoke component="addressbook-beta" method="addGroup" contactdsn="#request.parentsite#" returnvariable="groupID" usergroupname="#siteurl#"> 
	 - Group:#groupID# added
		</cfdefaultcase>
	</cfswitch> 
	<ol>
	<!--- reset the site contacts var--->
	<cfset siteContacts=0>
	
	<cfset contactCount=0>
	
	<cfset sleep(600)>
	
	<cfinvoke component="addressbook-beta" method="searchContacts" contactdsn="#siteurl#" returnvariable="siteContacts" numofContacts="200000">
		<cfloop query="siteContacts" startrow="13750">
			<cfset sleep(150)>
			<cfset newClientUserid=0>
			<cfset contactCount=contactCount+1>
			<cfset newClientUserid="#request.clientsiteid##siteContacts.currentRow#">
		<li>#userid#-#firstname# #lastname# - Now = #newClientUserid#
		<!--- reset the newContact var --->
		<cfset newContactID=0>
		<!--- 
		<cfif request.clientsiteid eq "AD" AND contactCount gt 6391>
		 --->
			<cftransaction >
				<cfinvoke component="addressbook-beta" method="addContact" contactdsn="#request.parentsite#" firstname="#firstname#"	lastname="#lastname#" address1="#address1#" address2="#address2#" city="#city#" state="#state#" zip="#zip#" wemail="#wemail#" hemail="#hemail#" memail="#memail#" oemail="#oemail#" hphone="#hphone#" wphone="#wphone#" mphone="#mphone#" fphone="#fphone#" ophone="#ophone#" clientuserid="#newClientUserid#" returnvariable="newContactID" >
				- Contact Added:#newContactID#
				<cfinvoke component="addressbook-beta" method="addContactToGroup" contactdsn="#request.parentsite#" nameid="#newContactID#" groupid="#groupID#">
				- Contact Added to groupID:#groupID#
			</cftransaction>
		
		<!--- 
		</cfif>
		 --->
		</li>
		<!--- Rest --->
		<cfif siteContacts.currentRow MOD 1000>
			<cfset sleep(1200)>
		</cfif>
		
		</cfloop>
		
	</ol>
	</li>
	</cfif>
</cfoutput>
</ol>