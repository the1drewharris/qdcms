<!--- 
If the form is valid: Steps to add a site 
	1.Add domain  
		-All files will be created at this point. These files should be edited for sites other than quick design sites
		-update A record
		-update www record
		-create email of the site owner
	2.Add database and create tables.
	3.Create DSN of the site
	4.Create 3 images galleries for quick design site.
	5.Add site info to site table in delta system
	6.Add Email of the user if provided. Password should be one uppercase, one number at least 6 characters
	7.Add user to security and assign role 
--->
<cfinclude template="siteformvalidator.cfm">
<cfif thereAreNoErrorsInForm>
	<!--- 1. Begin: DirectAdmin, Add site and email ---> 
	Begin: Stage 1 ...
	<!---
	<cfset subdomaincreated=FALSE>
	<cfobject component="directadmin" name="objdirectadmin">
	<cfset objdirectadmin.init()>
	
	<cfif Trim(form.parentid) EQ "0">
		<cfinvoke component="#objdirectadmin#" method="addDomain" domain="#form.siteurl#" returnvariable="myresult">
	<cfelse>
		<cfinvoke component="#application.objsite#" method="getsiteinfo" siteid="#form.parentid#" returnvariable="parentsiteinfo">
		<cfif parentsiteinfo.recordcount GT 0>
			<cfset temp=form.siteurl>
			<cfinvoke component="#objdirectadmin#" method="addSubDomain" domain="#parentsiteinfo.siteurl#" subdomain="#form.siteurl#">
			<cfset form.siteurl="#form.siteurl#.#parentsiteinfo.siteurl#">
			<cfset subdomaincreated=TRUE>
			Subdomain created...
		<cfelse>
			Parent Site Does not Exist. <cfabort>
		</cfif>
	</cfif>
	
	<cfif NOT subdomaincreated>
		<cfset args=structNew()>
		<cfset args.domain=form.siteurl>
		
		<cfset args.recordname="#form.siteurl#.">
		<cfinvoke component="#objdirectadmin#" method="deleteARecord" argumentcollection="#args#"> 
		<cfset args.recordname="www">
		<cfinvoke component="#objdirectadmin#" method="deleteARecord" argumentcollection="#args#"> 
		<cfset args.recordname="#form.siteurl#.">
		<cfinvoke component="#objdirectadmin#" method="addARecord" argumentcollection="#args#">
		<cfset args.recordname="www">
		<cfinvoke component="#objdirectadmin#" method="addARecord" argumentcollection="#args#">
		<cfset args=StructNew()>
		<cfset args.domain=form.siteurl>
		<cfset args.email=form.firstname>
		<cfset args.pw=form.pw>
		<cfinvoke component="#objdirectadmin#" method="addEmail" argumentcollection="#args#" returnvariable="result">
		
	<cfelse>
		
		<cfset args=structNew()>
		<cfset args.recordname=temp>
		<cfset args.domain=parentsiteinfo.siteurl>
		<cfset args.ip="208.65.113.148">
		<cfinvoke component="#objdirectadmin#" method="deleteARecord" argumentcollection="#args#"> 
		<cfif listcontainsnocase(#form.siteurl#,'jbfsale','.')>
			<cfset args.ip="208.65.113.146">
		<cfelse>
			<cfset args.ip="208.65.113.211">
		</cfif>
		<cfinvoke component="#objdirectadmin#" method="addARecord" argumentcollection="#args#">
		
	</cfif>--->
	Done <br />
	<!--- End: DirectAdmin --->
	
	<!--- 2. Add Database --->
	Begin: Stage 2 ... 
	<!---<cfinvoke component="#application.objsite#" method="addDatabase" siteurl="#form.siteurl#">--->
	Done <br />
	<!--- End: add Database --->
	
	<!--- 3. Add dsn, clear database ---> 
	Begin Stage 3 ... 
	<!--- <cfinvoke component="#application.objsite#" method="addDsn" sitedsn="#form.siteurl#">
	<cfinvoke component="#application.objsite#" method="deleteAllSiteData" siteurl="#form.siteurl#"> --->
	Done <br />
	<!--- End: Add dsn --->
	
	<!--- 8. Begin: Create Database --->
	Begin: State 8 running BuildTables to update/fix any tables
	<cfinvoke component="buildtables" method="buildAllTables" ds="#form.siteurl#"> 
	...Done
	<br />
	<!--- End: Create Database --->
	
	<!--- 4. Start: Create Image Galleries --->
	Begin: Stage 4 ...

		<!--- <cfset args=StructNew()>
		<cfset args.imagedsn="#form.siteurl#">
		<cfset args.galleryname="Logo">
		<cfset args.galleryid="1000">
		<cfinvoke component="#application.objimagegallery#" method="addgallerywithid" argumentcollection="#args#">
		
		<cfset args.galleryname="Header">
		<cfset args.galleryid="1001">
		<cfinvoke component="#application.objimagegallery#" method="addgallerywithid" argumentcollection="#args#">
		
		<cfset args.galleryname="Telephone">
		<cfset args.galleryid="1002">
		
		<cfinvoke component="#application.objimagegallery#" method="addgallerywithid" argumentcollection="#args#">
	 --->
	Done 

	<br />
	<!--- End: Create Image Galleries --->
	
	<!--- 5. Add Site Info --->
	Begin: Stage 5 ...
	<cfset form.parentsiteid=form.parentid>
	<!--- <cfinvoke component="#Application.objsite#" method="addsite" argumentcollection="#form#" returnvariable="myNewSiteId"> --->
	Done <br />
	<!--- End: Add site info --->
	
	<!--- 6. Begin: Add contact to Quantum Delta --->
	Begin: Stage 6 ...
	
		<cfset contact=structNew()>
		<cfset contact.contactdsn="quantumdelta.com">
		<cfset contact.firstname=form.firstname>
		<cfset contact.lastname=form.lastname>
		<cfset contact.city=form.scity>
		<cfset contact.state=form.sstate>
		<cfset contact.company=form.orgname>
		<cfset contact.website=form.siteurl>
		<cfset contact.wphone=form.orgphone>
		<cfset contact.myusername="#form.firstname#@#form.siteurl#">
		<cfset contact.mypassword=form.pw>
		<cfinvoke component="#application.abCFC#" method="addContact" argumentcollection="#contact#">
		Done 
	
	<br />
	<!--- End: Add contact to Quantum Delta --->
	
	<!--- Begin:
	7. Add user to security and assign role
		 1. copy this user to security - populate name and address table of delta system
 		 2. add record to people2site - nameid, siteid and roleid. Roleid should be 2. 
	--->
	
	<!--- *modification needed here as of 20100428 --->
	Begin: Stage 7 ...

	<!--- <cfset contact.contactdsn="deltasystem">
	<cfinvoke component="#application.abCFC#" method="addcontact" argumentcollection="#contact#" returnvariable="nameid">
	<cfinvoke component="#application.objsite#" method="addpeople2site" nameid="#nameid#" siteid="#myNewSiteId#"> --->
	Done 

	<br />
	<!--- End: Add user --->
	
	
	
	<!--- Begin: add home page --->
	Begin: State 9 ...
	<cfset args=StructNew()>
	<cfset args.webdsn=form.siteurl>
	<cfset args.name="home">
	<cfset args.wpstatus="Published">
	<cfset args.wpcontent="">
	<cfset args.startdate=application.objtimedateconversion.createtimedate()>
	<cfset args.enddate="2099010100000000">
	<cfset args.authorid=client.masternameid>
	<cfset args.ignoreenddate=1>
	<cfinvoke component="#application.objwebpage#" method="addPage" argumentcollection="#args#">
	Done <br />
	<!--- End: Add home page --->
	Site Creation Successful
<cfelse>
	<cflocation url="/cms/administration/site/addnewsite" addtoken="false">
</cfif>