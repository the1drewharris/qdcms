<cfset errorInForm=FALSE>
<cfset client.jbfDenied=0>
<cfset args=StructNew()>
<cfset args.myusername=Trim(form.myusername)>
<cfset args.pass=Trim(form.pass)>

<cfif args.myusername EQ "">
	<cfset errorInForm=TRUE>
<cfelseif args.pass EQ "">
	<cfset client.errorlist="Password can not be blank">
	<cfset errorInForm=TRUE>
</cfif>

<cfif NOT errorInForm>
	<cfinvoke component="#application.objqdsecurity#" method="authenicate" argumentcollection="#args#" returnvariable="secure">
	<cfif secure.authenicated NEQ 1>
		<cfset client.errorlist=secure.message>
		<cfset errorInForm=TRUE>
	</cfif>	
</cfif>

<cfif errorInForm>
	<cflocation url="/cms/login" addtoken="false">
<cfelse> 
	<cfif secure.roleid LT 7>
		<cfinvoke component="#application.objqdsecurity#" method="getSitesWithPermission" userid="#secure.userid#" returnvariable="Session.sites">
		<cfset client.allowedsites=valueList(session.sites.siteid)>
		<cfif Session.sites.recordcount EQ 0>
			<cfset client.errorlist="Sorry, you do not have access to any sites. Please contact your reseller.">
			<cfif listcontainsnocase('#args.myusername#',"jbfsale",".")>
				<cfsavecontent variable="client.jbfDenied">
				<h1>Just Between Friends Franchisees, </h1>
				<p>
				As of August 31, 2012, we have discontinued access to your QDCMS information.  
				We are no longer able to provide access to this information/data at no charge.  
				We will be permanently deleting the data on September 15th, 2012... However, in an effort to help users who still need access to their data, the fee schedule below will apply.
				</p>
				<p>
				You have until September 15th to notify QD (<a href="mailto:drew@quantumdelta.com">Drew@QuantumDelta.com</a>) if you would like to:
				A) Pay a $100 reactivation* fee to have unlimited access to your data in QDCMS until the end of September.
				B) Pay the $100 reactivation fee plus a $300/year flat fee to keep your QDCMS data and access active. For those with more than one site there is only one reactivation fee but the $300/year flat fee is per site as there are costs associated with each sites data.
				In order to reactivate access, payment* will need to be made prior to activation(details below), an email from you with your QDCMS username, and name of the site or sites in which you would like access.
				</p>
				
				<h2>*Reactivation expectations</h2>
				<p>
				During business hours (M-F 8am to 4pm Central Time) QD will require 1 hour lead time to reactivate an account.
				During non-business hours reactivation will happen the following business day unless a PANIC fee is applied.
				PANIC refers to QD dropping everything and getting you reactivated during non-business hours. 
				The PANIC fee is an additional $75.  With this fee, QD will have your account reactivated within 3 hours or as soon as QD can get to a computer and make it happen.
				</p>
				
				<h2>**Payment details</h2>
				<ul>
					<li>Credit cards are accepted over the phone and may be done so by calling (918) 732-9267.</li>
					<li>Paypal payments are also accepted to drew@quantumdelta.com.</li>
				</ul>
				
				<h2>Important dates:</h2>
				<p>
				September 15th is the deadline for franchise owners to notify and pay for reactivation of their QDCMS. After that date anyone who has not notified and paid for this service will have their data purged from our systems completely.
				</p>
				<p>
				September 30th is the deadline for those who have been reactivated to have established and paid for a yearly plan or have all their data downloaded. If there is no yearly plan established and paid for then access to QDCMS will be terminated and their data will be purged.
				</p>
				</cfsavecontent>
			<cfelse>
				<cfset client.jbfDenied=0>
			</cfif>
			<cflocation url="/cms/logion" addtoken="false">
		</cfif>
	<cfelse>
		<cfinvoke component="#application.objqdsecurity#" method="getSitesWithPermission" returnvariable="Session.sites">
		<cfset client.allowedsites=0><!--- Access to all sites --->
	</cfif>
	
	<cfquery name="adminsites" dbtype="query">
		SELECT SITEID FROM SESSION.SITES
		WHERE ROLEID>=4
	</cfquery>
	
	<cfset Session.adminsites=ValueList(adminsites.SITEID)>
	
	<cfset client.authenicated=1>
	<cfset client.masternameid=secure.userid>
	<cfset client.firstname=secure.firstname>
	<cfset client.lastname=secure.lastname>
	<cfset client.roleid=secure.roleid>
	<cfset client.username=args.myusername>
	<cfif listlen(client.allowedsites) EQ 1 AND client.allowedsites NEQ 0>
		<cfset url.siteid=client.allowedsites>
	<cfelse>
		<cfset url.siteid=secure.lastsiteid>
	</cfif>
	<cfinclude template="/actions/aclaction.cfm">
	<cflocation url="/" addtoken="false">
</cfif>