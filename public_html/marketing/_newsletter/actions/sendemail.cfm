<!--- 
logic: 
Choices: 1. Test Send 2.Send Now 3. Scheduled Send
1. Test send: newsletterid is not 0, ds=client.siteurl, args.fromaddress=client.username, from.testsend=1, args.toemail=0:someemailaddress
2. Send now: newsletterid is not 0, ds=client.siteurl, args.fromaddress=client.username, from.testsend=0
3. Scheduled send: newsletterid=0, ds=url.site, args.fromaddress=url.from, form.testsend=0
 --->
<cfparam name="newsletterid" default=0>
<cfparam name="url.site" default=0>
<cfparam name="url.from" default=0>
<cfparam name="url.testsend" default=0>


<cfset args=structNew()>
<cfset args.newsletterid=newsletterid>
<!--- <cfset args.fromname="#client.firstname# #client.lastname#"> --->
<cfif url.site EQ 0>
	<cfset args.ds=client.siteurl> <!--- not scheduled send --->
	<cfset args.fromaddress=client.username>
	
	<cfif form.testsend EQ "1">
		<cfset args.toemail="0:#client.username#"> <!--- It is test send --->
	<cfelse>
		<!--- it is not a test send --->
	</cfif>
	
<cfelse>
	<cfset args.ds=url.site> <!--- is scheduled send --->
	<cfset args.fromaddress=url.from>	
</cfif>

<cfinvoke component="newsletter-beta" method="sendnewsletter" argumentcollection="#args#">