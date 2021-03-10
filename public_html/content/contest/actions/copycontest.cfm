<cftransaction>
	<cfloop list="#url.contestList#" index="id">
		<cfinvoke component="#Application.objcontest#" method="getcontest" contestdsn="#client.siteurl#" contestid="#id#" returnVariable="getMycontest" />
		<cfset args=StructNew()>
		<cfset args.description="Copy of #getMycontest.description#">
		<cfset args.longdescription="#getMycontest.longdescription#">
		<cfset args.question="#getMycontest.question#">
		<cfset args.startdate="#getMycontest.startdate#">
		<cfset args.enddate="#getMycontest.enddate#">
		<cfset args.answerrequired="#getMycontest.answerrequired#">
		<cfset args.imagerequired="#getMycontest.imagerequired#">
		<cfset args.videorequired="#getMycontest.videorequired#">
		<cfset args.nameid="#client.masternameid#">
		<cfinvoke component="#Application.objcontest#" method="addcontest" contestdsn="#client.siteurl#" argumentcollection="#args#" />
	</cfloop>
</cftransaction>
<cfinclude template="/actions/tracking.cfm">
<cflocation url="#CGI.HTTP_REFERER#" addToken="false"> 