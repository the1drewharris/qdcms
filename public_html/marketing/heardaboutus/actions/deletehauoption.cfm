<cfset args=StructNew()>
<cfset args.haudsn=client.siteurl>
<cfset args.aboutusid=url.h>
<cftransaction>
	<cfinvoke component="#application.objhau#" method="deletehauoption" argumentcollection="#args#">
</cftransaction>
<cfinclude template="/actions/tracking.cfm">
<cflocation url="/cms/marketing/heardaboutus/showhauoptions" addtoken="false">