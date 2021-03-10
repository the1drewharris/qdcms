<cfif NOT thereAreErrors>
	<cfset client.referer=CGI.HTTP_REFERER>
	<cfinvoke component="#application.abCFC#" method="getContactInfo" contactdsn="#client.siteurl#" nameid="#url.id#" returnvariable="thisContact">
	<cfif thisContact.recordcount LTE 0>
		<cflocation url="/cms/crm/addressbook/showcontacts" addtoken="false">
	<cfelse>
		<cfinvoke component="#application.abCFC#" method="getContactGroups" contactdsn="#client.siteurl#" nameid="#thisContact.userid#" returnvariable="contactGroups">
		<cfset Session.formValues['groups']=ValueList(contactgroups.groupid)>
		<cfset Session.formValues['mynameid']=url.id>
		<cfset Session.formValues['firstname']=thisContact.firstname>
		<cfset Session.formValues['lastname']=thisContact.lastname>
		<cfset Session.formValues['middlename']=thisContact.middlename>
		<cfset Session.formValues['company']=thisContact.company>
		<cfset Session.formValues['title']=thisContact.title>
		<cfset Session.formValues['mphone']=thisContact.mphone>
		<cfset Session.formValues['wphone']=thisContact.wphone>
		<cfset Session.formValues['hphone']=thisContact.hphone>
		<cfset Session.formValues['fphone']=thisContact.fphone>
		<cfset Session.formValues['ophone']=thisContact.ophone>
		<cfset Session.formValues['myurl']=thisContact.url>
		<cfset Session.formValues['address1']=thisContact.address1>
		<cfset Session.formValues['address2']=thisContact.address2>
		<cfset Session.formValues['city']=thisContact.city>
		<cfset Session.formValues['state']=thisContact.state>
		<cfset Session.formValues['country']=thisContact.country>		
		<cfset Session.formValues['zip']=thisContact.zip>
		<cfset Session.formValues['description']=thisContact.description>
		<cfset Session.formValues['hemail']=thisContact.hemail>
		<cfset Session.formValues['wemail']=thisContact.wemail>
		<cfset Session.formValues['memail']=thisContact.memail>
		<cfset Session.formValues['oemail']=thisContact.oemail>
		<cfset Session.formValues['myusername']=thisContact.username>
		<cfif thisContact.password NEQ '0'>
			<cfset Session.formValues['mypassword']=thisContact.password>
		</cfif>
		<cfset Session.formValues['clientuserid']=thisContact.clientuserid>
		<cfset Session.formValues['referredby']=thisContact.referredby>
		<cfset Session.formValues['maritalstatus']=thisContact.maritalstatus>
		<cfset Session.formValues['spousename']=thisContact.spousename>
		<cfset Session.formValues['gender']=thisContact.gender>
		<cfset Session.formValues['dob']=thisContact.dob>
		<cfset Session.formValues['aol']=thisContact.aol>
		<cfset Session.formValues['yahoo']=thisContact.yahoo>
		<cfset Session.formValues['msn']=thisContact.msn>
		<cfset Session.formValues['mac']=thisContact.mac>
		<cfset Session.formValues['jabber']=thisContact.jabber>
		<cfset Session.formValues['icq']=thisContact.icq>
		<cfset Session.formValues['twitter']=thisContact.twitter>
		<cfset Session.formValues['linkedin']=thisContact.linkedin>
		<cfset Session.formValues['youtube']=thisContact.youtube>
		<cfset Session.formValues['facebook']=thisContact.facebook>
		<cfset Session.formValues['myspace']=thisContact.myspace>
		<cfset Session.formValues['friendfeed']=thisContact.friendfeed>
		<cfset Session.formValues['plaxo']=thisContact.plaxo>
		<cfset Session.formValues['imgpath']=thisContact.imagepath>
	</cfif>
</cfif>