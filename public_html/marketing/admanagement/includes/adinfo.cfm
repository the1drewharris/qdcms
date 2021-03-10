<cfparam name="url.adid" default="0">
<cfinvoke component="#application.objadmanagement#" method="getbannerad" admanagementdsn="#client.siteurl#" returnvariable="bannerad" adid="#url.adid#">
<cfinvoke component="#application.objadmanagement#" method="getLatestRenewAd" admanagementdsn="#client.siteurl#" returnvariable="latestrenewad" adid="#url.adid#">
<cfif bannerad.recordcount GT 0>
	<cfset Session.formValues['adname']=bannerad.adname>
	<cfset Session.formValues['adid']=bannerad.adid>
	<cfset Session.formValues['renewid']=latestrenewad.renewid>
	<cfset Session.formValues['zoneid']=bannerad.zoneid>
	<cfset Session.formValues['advertiser_nameid']=bannerad.advertiser_nameid>
	<cfset Session.formValues['target_url']=bannerad.target_url>
	<cfset Session.formValues['displaytext']=bannerad.displaytext>
	
	<cfset Session.formValues['startdate']=application.objtimedateconversion.convertDate(latestrenewad.startdate,'yyyy/mm/dd')>
	<cfset Session.formValues['starthour']=application.objtimedateconversion.convertTime(latestrenewad.startdate,'hh')>
	<cfset Session.formValues['startminute']=application.objtimedateconversion.convertTime(latestrenewad.startdate,'mm')>
	<cfset Session.formValues['startampm']=application.objtimedateconversion.convertTime(latestrenewad.startdate,'tt')>
	
	<cfset Session.formValues['enddate']=application.objtimedateconversion.convertDate(latestrenewad.enddate,'yyyy/mm/dd')>
	<cfset Session.formValues['endhour']=application.objtimedateconversion.convertTime(latestrenewad.startdate,'hh')>
	<cfset Session.formValues['endminute']=application.objtimedateconversion.convertTime(latestrenewad.startdate,'mm')>
	<cfset Session.formValues['endampm']=application.objtimedateconversion.convertTime(latestrenewad.startdate,'tt')>
	
	<cfset Session.formValues['active']=latestrenewad.active>
	<cfset Session.formValues['check_date']=latestrenewad.check_date>
	<cfif latestrenewad.maximpression EQ 0>
		<cfset Session.formValues['maximpression']="Unlimited">
	<cfelse>
		<cfset Session.formValues['maximpression']=latestrenewad.maximpression>
	</cfif>
	
	<cfif latestrenewad.maxclick EQ 0>
		<cfset Session.formValues['maxclick']="Unlimited">
	<cfelse>
		<cfset Session.formValues['maxclick']=latestrenewad.maxclick>
	</cfif>
	<cfset client.thisad="#bannerad.adid#,#bannerad.image_path#">
<cfelse>
	
</cfif>