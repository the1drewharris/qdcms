<cfif NOT thereAreErrors> <!--- thereAreErrors is defined in /display/errors.cfm --->
	<cfinvoke component="#application.objvideolib#" method="getVideos" videodsn='#client.siteurl#' mediatypeid="2" vid="#url.v#" returnvariable="videoInfo">
	<cfinvoke component="#application.objvideolib#" method="isSubscriableProduct" videodsn="#client.siteurl#" vid="#url.v#" returnvariable="itIsSubscriable">
	
	<cfinvoke component="#application.objfile#" method="getfiles" filedsn="#client.siteurl#" id="#url.v#" returnvariable="files">
	<cfif files.recordcount GT 0>
		<cfset filesExists=TRUE>
	</cfif>
	
	<cfif itIsSubscriable EQ 1>
		<cfinvoke component="#application.objsubscription#" method="getretailprice" subscriptiondsn="#client.siteurl#" vid="#url.v#" returnvariable="retailprice">
		<cfinvoke component="#application.objvideolib#" method="getsamples" videodsn="#client.siteurl#" vid="#url.v#" returnvariable="samples">
		<cfset Session.formValues['sampleid']=samples.sampleid>
		<cfset Session.formValues['samplename']=samples.samplename>
		<cfset Session.formValues['subs_price']=retailprice>
	</cfif>
	
	<cfset Session.formValues['vid']=url.v>
	<cfset Session.formValues['title']=videoinfo.title>	
	<cfset Session.formValues['link']=videoinfo.link>
	<cfset Session.formValues['status']=videoinfo.status>
	<cfset Session.formValues['summary']=videoinfo.summary>
	<cfset Session.formValues['description']=videoinfo.description>
	<cfset Session.formValues['keywords']=videoinfo.keywords>
	<cfset Session.formValues['caption']=videoinfo.caption>
	<cfset Session.formValues['subscriableproduct']=itIsSubscriable>
</cfif>